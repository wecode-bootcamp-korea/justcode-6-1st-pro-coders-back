const cartDao = require('../models/cart');

const getUserCart = async (user_id, token) => {
  //토큰 유효성 확인
  const result = await cartDao.getCartByUserId(user_id);
  return result;
};

// const addCart = async (user_id, token, product_size_id, count) => {
//   //토큰 유효성 확인
//   const result = await cartDao.postCartByReqData(
//     user_id,
//     product_size_id,
//     counts
//   );
//   return result;
// };

// const deleteItem = async (cart_id, token) => {
//   //토큰 유효성 확인
//   const result = await cartDao.deleteCartById(cart_id);
//   return result;
// };

// const deleteAllItem = async (user_id, token) => {
//   //토큰 유효성 확인
//   const result = await cartDao.deleteCartByUserId(user_id);
//   return result;
// };

module.exports = {
  getUserCart,
  // addCart,
  // deleteItem,
  // deleteAllItem,
};
