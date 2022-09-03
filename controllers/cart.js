const cartService = require('../services/cart');

const getUserCart = async (req, res) => {
  //const token = req.get('authorization');
  const { user_id } = req.query;
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

const addCart = async (req, res) => {
  //const token = req.get('authorization');
  const { user_id, product_id, size_id, count } = req.body;
  try {
    const result = await cartService.addCart(
      user_id,
      //token,
      product_id,
      size_id,
      count
    );
    console.log(result);
    res.status(200).json({ message: 'Item Added' });
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

const deleteItem = async (req, res) => {
  const { cart_id } = req.query;
  try {
    const result = await cartService.deleteItem(
      cart_id //, token
    );
    console.log(result);
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

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
  addCart,
  deleteItem,
  // deleteAllItem,
};
