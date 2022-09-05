const express = require('express');
const router = express.Router();

const userrouter = require('../routes/userrouter');

const searchRouter = require('./search');
const cartRouter = require('./cart');
const productRouter = require('./product');
const storeRouter = require('./store');

router.use('/search', searchRouter);
router.use('/cart', cartRouter);
router.use('/products', productRouter);
router.use('/store', storeRouter);

router.use('/user', userrouter);

module.exports = router;
