const express = require('express');

const userRouter = require('./user');
const searchRouter = require('./search');
// const otherRouter = require('./other');

const router = express.Router();

router.use('/users', userRouter);
router.use('/search', searchRouter);

module.exports = router;
