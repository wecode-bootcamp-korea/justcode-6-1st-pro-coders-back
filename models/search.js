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
  console.log(text);
  const result = await myDataSource.query(
    `SELECT * FROM postings WHERE postings.contents REGEXP '작은|성공'` //controller에서 데이터 trim(앞 뒤 공백 ), 복잡한 검색(키워드 두개 이상)에는 REGEXP 예약어 사용
  );
  console.log(result);
  return result;
};

module.exports = { getProductIdByText };
