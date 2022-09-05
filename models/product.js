const { myDataSource } = require('./typeorm-client');

const getProductByType = async type => {
  await myDataSource.query(
    `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
  );
  const result = await myDataSource.query(
    `SELECT * FROM product_summary WHERE type = ?
  `,
    [type]
  );
  if (!result[0]) {
    let error = new Error('Error: No Data');
    error.code = 204;
    throw error;
  }
  return result;
};

const getProductByCategory = async category => {
  await myDataSource.query(
    `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
  );
  const result = await myDataSource.query(
    `SELECT * FROM product_summary WHERE category = ?
  `,
    [category]
  );
  if (!result[0]) {
    let error = new Error('Error: No Data');
    error.code = 204;
    throw error;
  }
  return result;
};

const getProductDetailById = async product_id => {
  await myDataSource.query(
    `SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))`
  );
  const result = await myDataSource.query(
    `SELECT * FROM product_detail WHERE id = ?
  `,
    [product_id]
  );
  if (!result[0]) {
    let error = new Error('Error: No Data');
    error.code = 204;
    throw error;
  }
  return result;
};

module.exports = {
  getProductByType,
  getProductByCategory,
  getProductDetailById,
};
