const mongoose = require('mongoose');
const cartDao = require('../models/cart');
const jwt = require('jsonwebtoken');

const getUserCart = async (
  user_id //, token
) => {
  //토큰 유효성 확인
  const result = await cartDao.getCartByUserId(user_id);
  return result;
};

const addCart = async (
  user_id, //token,
  product_id,
  size_id,
  count
) => {
  //토큰 유효성 확인
  await cartDao.isUserVaild(user_id);
  const product_size_id = await cartDao.getProductSizeIdByProductIdAndSizeId(
    product_id,
    size_id
  );
  await cartDao.isCartItemAlreadyExist(user_id, product_size_id);
  const result = await cartDao.postCart(user_id, product_size_id, count);
  return result;
};

const deleteItem = async (
  cart_id //, token
) => {
  //토큰 유효성 확인
  let user_id = await cartDao.getUserIdByCartId(cart_id);
  console.log(user_id);
  await cartDao.deleteCartById(cart_id);
  const result = await cartDao.getCartByUserId(user_id);
  return result;
};

// const deleteAllItem = async (user_id, token) => {
//   //토큰 유효성 확인
//   const result = await cartDao.deleteCartByUserId(user_id);
//   return result;
// };

module.exports = {
  getUserCart,
  addCart,
  deleteItem,
  // deleteAllItem,
};
