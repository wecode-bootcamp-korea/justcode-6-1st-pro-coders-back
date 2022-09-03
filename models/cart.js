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
  SELECT * FROM cart_data AS c WHERE user_id = ?
  `,
    [user_id]
  );
  return result;
};

// const postCartByReqData = async (user_id, product_size_id, count) => {
//   return result;
// };

// const deleteCartById = async cart_id => {
//   return result;
// };

// const deleteCartByUserId = async user_id => {
//   return result;
// };

module.exports = {
  getCartByUserId,
  // postCartByReqData,
  // deleteCartById,
  // deleteCartByUserId,
};
