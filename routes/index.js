const express = require('express');

const userRouter = require('./user');
const searchRouter = require('./search');
const cartRouter = require('./cart');
const productRouter = require('./product');

const router = express.Router();

router.use('/users', userRouter);
router.use('/search', searchRouter);
router.use('/cart', cartRouter);
router.use('/products', productRouter);
//router.use('/store',storeRouter)

module.exports = router;
