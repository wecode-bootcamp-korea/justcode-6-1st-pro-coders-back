const mongoose = require('mongoose');
const productDao = require('../models/product');

const getProductByType = async type => {
  const result = await productDao.getProductByType(type);
  return result;
};

const getProductByCategory = async category => {
  const result = await productDao.getProductByCategory(category);
  return result;
};

const getProductDetail = async product_id => {
  const result = await productDao.getProductDetailById(product_id);
  return result;
};

module.exports = {
  getProductByType,
  getProductByCategory,
  getProductDetail,
};
