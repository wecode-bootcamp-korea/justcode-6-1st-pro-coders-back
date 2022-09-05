const express = require('express');
const router = express.Router();

const userrouter = require("../routes/userrouter");
// const cartrouter = require("../routes/cartrouter");
// const salerouter = require("../routes/salerouter");

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

router.use('/user', userrouter);
// router.use('/cart', cartrouter);
// router.use('/sale', salerouter);

module.exports = router;