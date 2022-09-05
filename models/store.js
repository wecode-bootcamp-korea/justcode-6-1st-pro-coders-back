const { myDataSource } = require('./typeorm-client');

const getStore = async () => {
  const result = await myDataSource.query(`SELECT * FROM store`);
  console.log(result);
  return result;
};

module.exports = {
  getStore,
};
