const searchService = require('../services/search');

const searchProduct = async (req, res) => {
  const { key } = req.query;
  if (!key) {
    res.status(400).json({ message: `please enter required data` });
    return;
  }

  try {
    const result = await searchService.searchProduct(key.trim());
    console.log(result);
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

module.exports = { searchProduct };
