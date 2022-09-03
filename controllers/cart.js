const cartService = require('../services/cart');

const getUserCart = async (req, res) => {
  console.log(req.header.token);
  try {
    const result = await cartService.getUserCart(
      user_id //, token
    );
    console.log(result);
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

// const addCart = async (req, res) => {
//   try {
//     const result = await cartService.addCart(
//       user_id,
//       token,
//       product_size_id,
//       count
//     );
//     console.log(result);
//     res.status(200).json(result);
//   } catch (error) {
//     console.log(error);
//     res.status(error.code).json(error.message);
//   }
// };

// const deleteItem = async (req, res) => {
//   try {
//     const result = await cartService.deleteItem(cart_id, token);
//     console.log(result);
//     res.status(200).json(result);
//   } catch (error) {
//     console.log(error);
//     res.status(error.code).json(error.message);
//   }
// };

// const deleteAllItem = async (req, res) => {
//   try {
//     const result = await cartService.deleteAllItem(user_id, token);
//     console.log(result);
//     res.status(200).json(result);
//   } catch (error) {
//     console.log(error);
//     res.status(error.code).json(error.message);
//   }
// };

module.exports = {
  getUserCart,
  // addCart,
  // deleteItem,
  // deleteAllItem,
};
