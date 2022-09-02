//const prismaClient = require('./prisma-client');

const { text } = require('express');
const { DataSource, Column } = require('typeorm');

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

const getProductIdByText = async text => {
  console.log('text: ', text);
  await myDataSource.query(
    `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
  );
  const result = await myDataSource.query(
    `SELECT id FROM search_base WHERE 
  keyword LIKE '%${text}%'
  OR title LIKE '%${text}%' 
  OR product_code LIKE '%${text}%' 
  OR contents LIKE '%${text}%'
  OR material LIKE '%${text}%'
  OR gender LIKE '%${text}%'
  OR category_name LIKE '%${text}%'
  OR subcategory_name LIKE '%${text}%'`
  );

  // const result = await myDataSource.query(
  //   `SELECT id, title FROM
  //   products WHERE products.title REGEXP ?`,
  //   [text]
  // );
  console.log(result);
  return result;
};

module.exports = { getProductIdByText };
