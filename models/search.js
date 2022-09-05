const { myDataSource } = require('./typeorm-client');

const getProductIdByText = async text => {
  await myDataSource.query(`SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))
  `);
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
          `SELECT * FROM product_summary WHERE id IN (${resultArr})`
        )
      )
    )
  );
  return resultData;
};

module.exports = { getProductIdByText };
