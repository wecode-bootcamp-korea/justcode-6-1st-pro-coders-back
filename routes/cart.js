const express = require('express');
const cartController = require('../controllers/cart');

const router = express.Router();

router.get('/', cartController.getUserCart);
router.post('/', cartController.addCart);
router.delete('/', cartController.deleteItem);
router.delete('/all', cartController.deleteAllItem);

module.exports = router;
