const express = require('express');
const router = express.Router();

const userRouter = require('./user');
const searchRouter = require('./search');
const cartRouter = require('./cart');
const productRouter = require('./product');
const storeRouter = require('./store');

router.use('/users', userRouter);
router.use('/search', searchRouter);
router.use('/cart', cartRouter);
router.use('/products', productRouter);
router.use('/store', storeRouter);

module.exports = router;
