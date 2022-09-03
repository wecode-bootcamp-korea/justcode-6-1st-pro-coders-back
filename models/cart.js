const { text } = require('express');
const { DataSource, Column, SimpleConsoleLogger } = require('typeorm');

const myDataSource = new DataSource({
  type: process.env.TYPEORM_CONNECTION,
  host: process.env.TYPEORM_HOST,
  port: process.env.TYPEORM_PORT,
  username: process.env.TYPEORM_USERNAME,
  password: process.env.TYPEORM_PASSWORD,
  database: process.env.TYPEORM_DATABASE,
});

myDataSource
  .initialize()
  .then(() => {
    console.log('Data Source has been initialized!');
  })
  .catch(() => {
    console.log('Date source initializing fail');
  });

const getCartByUserId = async user_id => {
  const user_cart = await myDataSource.query(
    `
  SELECT * FROM cart_data WHERE user_id = ?
  `,
    [user_id]
  );
  let total_price = 0;
  for (let i = 0; i < user_cart.length; i++) {
    total_price += +user_cart[i].duped_price;
  }
  console.log(total_price);
  let data = {};
  data.total_count = user_cart.length;
  data.total_price = total_price;
  user_cart.unshift(data);
  console.log(data);
  return user_cart;
};
const getProductSizeIdByProductIdAndSizeId = async (product_id, size_id) => {
  try {
    let product_size_id_temp = await myDataSource.query(
      `SELECT id FROM product_size WHERE (product_id = ? AND size_id = ?)`,
      [product_id, size_id]
    );
    const product_size_id = Object.values(
      JSON.parse(JSON.stringify(product_size_id_temp))
    )[0].id;
    return product_size_id;
  } catch (err) {
    let error = new Error('Error: Item Invalid');
    error.code = 400;
    throw error;
  }
};

const isUserVaild = async user_id => {
  try {
    const result = await myDataSource.query(
      `SELECT id FROM users WHERE id = ?`,
      [user_id]
    );
  } catch (err) {
    let error = new Error('Error: User Invalid');
    error.code = 400;
    throw error;
  }
};

const isCartItemAlreadyExist = async (user_id, procduct_size_id) => {
  const result = await myDataSource.query(
    `SELECT id FROM cart WHERE (user_id = ? AND product_size_id = ?)`,
    [user_id, procduct_size_id]
  );
  if (result) {
    let error = new Error('Error: The Item is Added Already');
    error.code = 400;
    throw error;
  }
};

const postCart = async (user_id, product_size_id, count) => {
  try {
    const result = await myDataSource.query(
      `INSERT INTO cart (user_id, product_size_id, count) VALUES (?, ?, ?)`,
      [user_id, product_size_id, count]
    );
    return result;
  } catch (err) {
    let error = new Error('Error: Item Add Fail');
    error.code = 400;
    throw error;
  }
};

const getUserIdByCartId = async cart_id => {
  try {
    const user_id_temp = await myDataSource.query(
      `SELECT user_id FROM cart WHERE cart.id = ?`,
      [cart_id]
    );
    const user_id = Object.values(JSON.parse(JSON.stringify(user_id_temp)))[0]
      .user_id;
    console.log('유저아이디: ', user_id);
    return user_id;
  } catch (err) {
    let error = new Error('Error: Cart Item Invalid');
    error.code = 400;
    throw error;
  }
};

const deleteCartById = async cart_id => {
  try {
    await myDataSource.query(`DELETE FROM cart WHERE cart.id = ?`, [cart_id]);
  } catch (err) {
    let error = new Error('Error: Item Delete Fail');
    error.code = 400;
    throw error;
  }
};

// const deleteCartByUserId = async user_id => {
//   return result;
// };

module.exports = {
  getCartByUserId,
  getProductSizeIdByProductIdAndSizeId,
  isUserVaild,
  isCartItemAlreadyExist,
  postCart,
  getUserIdByCartId,
  deleteCartById,
  // deleteCartByUserId,
};
