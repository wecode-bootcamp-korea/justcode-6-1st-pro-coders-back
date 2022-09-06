const cartService = require('../services/cart');

const getUserCart = async (req, res) => {
  const token = req.get('authorization');
  try {
    const result = await cartService.getUserCart(token);
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

const addCart = async (req, res) => {
  const token = req.get('authorization');
  const hasKey = {
    user_id: false,
    product_id: false,
    size: false,
    count: false,
  };
  const requireKey = Object.keys(hasKey);

  Object.entries(req.body).forEach(keyValue => {
    const [key, value] = keyValue;
    if (requireKey.includes(key) && value) {
      hasKey[key] = true;
    }
  });
  const hasKeyArray = Object.entries(hasKey);
  for (let i = 0; i < hasKeyArray.length; i++) {
    const [key, value] = hasKeyArray[i];
    if (!value) {
      res.status(400).json({ message: `please enter ${key}` });
      return;
    }
  }

  const { user_id, product_id, size, count } = req.body;
  try {
    const result = await cartService.addCart(
      //user_id,
      token,
      product_id,
      size,
      count
    );
    res.status(200).json({ message: 'Item Added' });
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

const deleteItem = async (req, res) => {
  const token = req.get('authorization');
  const { cart_id } = req.query;
  if (!cart_id) {
    res.status(400).json({ message: `please enter cart_id` });
    return;
  }
  try {
    const result = await cartService.deleteItem(cart_id, token);
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

const deleteAllItem = async (req, res) => {
  const token = req.get('authorization');
  const { user_id } = req.query;
  if (!user_id) {
    res.status(400).json({ message: `please enter user_id` });
    return;
  }
  try {
    const result = await cartService.deleteAllItem(
      //user_id,
      token
    );
    res.status(200).json({ massege: 'All Item Removed' });
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

module.exports = {
  getUserCart,
  addCart,
  deleteItem,
  deleteAllItem,
};
