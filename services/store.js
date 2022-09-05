const storeDao = require('../models/store');

const getStore = async () => {
  const result = await storeDao.getStore();
  return result;
};

module.exports = {
  getStore,
};
