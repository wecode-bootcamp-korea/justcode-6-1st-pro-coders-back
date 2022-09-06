const { myDataSource } = require('./typeorm-client');

const getCartByUserId = async user_id => {
  await myDataSource.query(
    `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
  );
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
  let data = {};
  data.total_count = user_cart.length;
  data.total_price = total_price;
  let result = {};
  result.result = data;
  result.cartList = user_cart;
  return result;
};

const getProductSizeIdByProductIdAndSize = async (product_id, size) => {
  try {
    let product_size_id_temp = await myDataSource.query(
      `SELECT product_size.id FROM product_size LEFT JOIN size ON product_size.size_id = size.id  WHERE (product_id = ? AND size.name = ?)`,
      [product_id, size]
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
  if (result[0]) {
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

const getCartIdByUserId = async user_id => {
  let result = await myDataSource.query(
    `SELECT id FROM cart WHERE cart.user_id = ?`,
    [user_id]
  );
  let resultObj = Object.values(JSON.parse(JSON.stringify(result)));
  let resultArr = [];
  for (let i of resultObj) {
    resultArr.push(i.id);
  }
  if (!resultArr[0]) {
    let error = new Error('Error: No Item in Cart');
    error.code = 400;
    throw error;
  }
  return resultArr;
};

const deleteCartByids = async cart_id_arr => {
  try {
    await myDataSource.query(`DELETE FROM cart WHERE cart.id in (?)`, [
      cart_id_arr,
    ]);
    return;
  } catch (err) {
    let error = new Error('Error: Item Delete Fail');
    error.code = 400;
    throw error;
  }
};

module.exports = {
  getCartByUserId,
  getProductSizeIdByProductIdAndSize,
  isUserVaild,
  isCartItemAlreadyExist,
  postCart,
  getUserIdByCartId,
  deleteCartById,
  getCartIdByUserId,
  deleteCartByids,
};
