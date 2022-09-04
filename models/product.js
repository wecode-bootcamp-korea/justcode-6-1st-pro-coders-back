// const { text } = require('express');
// const { DataSource, Column, SimpleConsoleLogger } = require('typeorm');

// const myDataSource = new DataSource({
//   type: process.env.TYPEORM_CONNECTION,
//   host: process.env.TYPEORM_HOST,
//   port: process.env.TYPEORM_PORT,
//   username: process.env.TYPEORM_USERNAME,
//   password: process.env.TYPEORM_PASSWORD,
//   database: process.env.TYPEORM_DATABASE,
// });

// myDataSource
//   .initialize()
//   .then(() => {
//     console.log('Data Source has been initialized!');
//     removeOnlyFullGroupBy();
//   })
//   .catch(() => {
//     console.log('Date source initializing fail');
//   });

// const removeOnlyFullGroupBy = async () => {
//   await myDataSource.query(
//     `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
//   );
// };

// const getProductByType = async type_id => {
//   const result = await myDataSource.query(
//     `SELECT * FROM WHERE
//   `,
//     []
//   );
//   return result;
// };

// const getProductByCategory = async catrgory => {
//   const result = await myDataSource.query(
//     `SELECT * FROM product_summary WHERE category = ?
//   `,
//     [category]
//   );
//   return result;
// };

// const getProductById = async () => {
//   const result = await myDataSource.query(
//     `SELECT * FROM product_summary WHERE category = ?,
//     []
//   );
//   return result;
// };

// module.exports = {
//   getProductByType,
//   getProductByCategory,
//   getProductById,
// };
