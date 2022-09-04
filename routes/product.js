const express = require('express');
const productController = require('../controllers/product');

const router = express.Router();

router.get('/', productController.getProduct);

// router.get((params = 'type'), productController.getProductByType);
// router.get('?category=', productController.getProductByCategory);
// router.get('?product_id=', productController.getProductDetail);

module.exports = router;
