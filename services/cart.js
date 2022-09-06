const mongoose = require('mongoose');
const cartDao = require('../models/cart');
const jwt = require('jsonwebtoken');

const getUserCart = async token => {
  let user_id = null;
  console.log(typeof token);
  console.log('토큰: ', token);
  if (token) {
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
      console.log(err);
      if (err) {
        console.log('에러 감지');
        let error = new Error('Error: Invaild Access');
        error.code = 403;
        throw error;
      } else {
        console.log('in else', decoded);
        user_id = decoded.userId;
      }
    });
  } else {
    res.status(401).json({ message: 'Error: Need Authorization' });
  }
  const result = await cartDao.getCartByUserId(user_id);
  return result;
};

const addCart = async (
  //user_id,
  token,
  product_id,
  size,
  count
) => {
  //토큰 유효성 확인
  let user_id = null;
  if (token) {
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
      console.log(err);
      if (err) {
        console.log('에러 감지');
        let error = new Error('Error: Invaild Access');
        error.code = 403;
        throw error;
      } else {
        console.log('in else', decoded);
        user_id = decoded.userId;
      }
    });
  } else {
    res.status(401).json({ message: 'Error: Need Authorization' });
  }

  await cartDao.isUserVaild(user_id);
  const product_size_id = await cartDao.getProductSizeIdByProductIdAndSize(
    product_id,
    size
  );
  await cartDao.isCartItemAlreadyExist(user_id, product_size_id);
  const result = await cartDao.postCart(user_id, product_size_id, count);
  return result;
};

const deleteItem = async (cart_id, token) => {
  //토큰 유효성 확인

  let user_id = null;
  if (token) {
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
      console.log(err);
      if (err) {
        console.log('에러 감지');
        let error = new Error('Error: Invaild Access');
        error.code = 403;
        throw error;
      } else {
        console.log('in else', decoded);
        user_id = decoded.userId;
      }
    });
  } else {
    res.status(401).json({ message: 'Error: Need Authorization' });
  }

  //let user_id = await cartDao.getUserIdByCartId(cart_id);
  await cartDao.deleteCartById(cart_id);
  const result = await cartDao.getCartByUserId(user_id);
  return result;
};

const deleteAllItem = async (
  //user_id,
  token
) => {
  //토큰 유효성 확인
  let user_id = null;
  if (token) {
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
      console.log(err);
      if (err) {
        console.log('에러 감지');
        let error = new Error('Error: Invaild Access');
        error.code = 403;
        throw error;
      } else {
        console.log('in else', decoded);
        user_id = decoded.userId;
      }
    });
  } else {
    res.status(401).json({ message: 'Error: Need Authorization' });
  }

  const cart_id_arr = await cartDao.getCartIdByUserId(user_id);
  const result = await cartDao.deleteCartByids(cart_id_arr);
  return result;
};

module.exports = {
  getUserCart,
  addCart,
  deleteItem,
  deleteAllItem,
};
