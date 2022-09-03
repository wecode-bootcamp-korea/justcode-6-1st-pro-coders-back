const express = require('express');

const userRouter = require('./user');
const searchRouter = require('./search');
const cartRouter = require('./cart');

const router = express.Router();

router.use('/users', userRouter);
router.use('/search', searchRouter);
router.use('/cart', cartRouter);

module.exports = router;
