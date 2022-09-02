const userDao = require('../models/loginDao.js');
const tokenKey = require('../token');

const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const loginUsingEmail = async (email, password) => {
  const user = await userDao.loginUsingEmail(email);

  if (user) {
    const isPwCorrect = bcrypt.compareSync(password, user.password);
    const token = jwt.sign({ userId: user.id }, tokenKey.secretKey);
    console.log(token);

    const userLoginData = {
      user: user,
      isPwCorrect: isPwCorrect,
      token: token,
    };
    return userLoginData;
  }
};

module.exports = {
  loginUsingEmail,
};