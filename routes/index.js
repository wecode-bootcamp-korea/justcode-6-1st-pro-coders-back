const express = require('express');

const userRouter = require('./user');
const searchRouter = require('./search');
const uploadRouter = require('./upload');

// const otherRouter = require('./other');

const router = express.Router();

router.use('/users', userRouter);
router.use('/search', searchRouter);
router.use('/upload', uploadRouter);

module.exports = router;
