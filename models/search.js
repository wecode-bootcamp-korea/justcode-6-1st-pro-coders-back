//const prismaClient = require('./prisma-client');

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
    removeOnlyFullGroupBy();
  })
  .catch(() => {
    console.log('Date source initializing fail');
  });

const removeOnlyFullGroupBy = async () => {
  await myDataSource.query(
    `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
  );
};

const getProductIdByText = async text => {
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
  if (!result[0]) {
    let error = new Error('Error: no search result');
    error.code = 204;
    throw error;
  }
  let resultObj = Object.values(JSON.parse(JSON.stringify(result)));
  let resultArr = [];
  for (let i of resultObj) {
    resultArr.push(i.id);
  }

  const resultData = Object.values(
    JSON.parse(
      JSON.stringify(
        await myDataSource.query(
          `SELECT * FROM product_detail WHERE id IN (${resultArr})`
        )
      )
    )
  );
  return resultData;
};

module.exports = { getProductIdByText };
