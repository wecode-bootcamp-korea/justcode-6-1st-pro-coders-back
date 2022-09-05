const express = require('express');
const router = express.Router();

const userController = require('../controllers/usercontroller');

router.post('/signup', userController.createUser);
router.post('/login', userController.userLogin);

module.exports = router;
