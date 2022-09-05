const productService = require('../services/product');

const getProduct = async (req, res) => {
  const parameter = req.query;
  const key = Object.keys(parameter);
  console.log('파라미터', parameter, key);
  let result;
  try {
    if (key[0] === 'type') {
      result = await getProductByType(parameter);
    } else if (key[0] === 'category') {
      result = await getProductByCategory(parameter);
    } else if (key[0] === 'product_id') {
      result = await getProductDetail(parameter);
    } else {
      let error = new Error('Error: Wrong path');
      error.code = 404;
      throw error;
    }
    console.log(result);
    res.status(200).json(result);
  } catch (error) {
    console.log('컨트롤', error);
    res.status(error.code).json(error.message);
  }
};

//key에 따른 분기
const getProductByType = async parameter => {
  const { type } = parameter;
  const result = await productService.getProductByType(type);
  return result;
};

const getProductByCategory = async parameter => {
  const { category } = parameter;
  const result = await productService.getProductByCategory(category);
  return result;
};

const getProductDetail = async parameter => {
  const { product_id } = parameter;
  const result = await productService.getProductDetail(product_id);
  return result;
};

module.exports = {
  getProduct,
};