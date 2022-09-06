const userDao = require('../models/userDao');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

// 사용자 회원가입
const createUser = async (
  email,
  password,
  name,
  phone_number,
  date_of_birth,
  gender,
  dormancy_prevention_period
) => {
  const hashedPw = await bcrypt.hash(password, 10);
  return await userDao.createUser(
    email,
    hashedPw,
    name,
    phone_number,
    date_of_birth,
    gender,
    dormancy_prevention_period
  );
};

// 이메일 중복체크
const emailCheck = async email => {
  const result = await userDao.emailCheck(email);

  let check = '';

  if (!result) {
    check = 'success';
  } else {
    check = 'fail';
  }

  return check;
};

// 사용자 정보 가져오기
const getUser = async token => {
  const user_id = jwt.verify(token, 'secretKey').user_id;

  const user = await userDao.getUserById(user_id);

  return user;
};

// 사용자 로그인
const userLogin = async (email, password) => {
  const user = await userDao.getUserByEmail(email);
  const result = { state: 'fail', token: '' };

  if (user) {
    const ok = await bcrypt.compare(password, user.password);
    console.log(ok);
    if (ok) {
      const token = jwt.sign({ userId: user.id }, process.env.SECRET_KEY);
      result.user_id = user.id;
      result.state = 'success';
      result.token = token;
    } else {
      let error = new Error('');
    }
  }
  console.log(result);
  return result;
};

// 사용자 정보 수정
const updateUser = async (nickname, stacks, profile_image, token) => {
  const user_id = jwt.verify(token, 'secretKey').user_id;

  await userDao.updateUser(nickname, stacks, profile_image, user_id);
};

module.exports = { createUser, emailCheck, getUser, userLogin, updateUser };
