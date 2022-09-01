const express = require('express');

const userRouter = require('./user');
// const otherRouter = require('./other');

const router = express.Router();

router.use(userRouter);
// router.use(otherRouter);
const userRouter = require('./userRouter');
const postRouter = require('./postRouter');

router.use('/user', userRouter);
router.use('/postings', postRouter);

module.exports = router;