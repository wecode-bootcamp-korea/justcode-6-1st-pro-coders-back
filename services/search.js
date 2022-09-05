const searchDao = require('../models/search');

const searchProduct = async text => {
  const result = await searchDao.getProductIdByText(text);
  return result;
};

module.exports = {
  searchProduct,
};
