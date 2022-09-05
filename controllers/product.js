const productService = require('../services/product');

// 상품정보 가져오기
const getProductDetails = async (req, res) => {
  try {
    const productId = req.params.id;
    const productDetails = await productService.productDetail(productId);
    return res.status(201).json(productDetails);
  } catch (error) {
    return res.status(error.statusCode || 500).json({ message: error.message });
  }
};

// 상품정보 
const getProducts = async (req, res) => {
  try {
    const keyword = req.res.sort;
    const searchList = await productService.getProducts(keyword);
    return res.status(201).json(searchList);
  } catch (error) {
    return res.status(error.statusCode || 500).json({ message: error.message });
  }
};

module.exports = { getProductDetails, getProducts };