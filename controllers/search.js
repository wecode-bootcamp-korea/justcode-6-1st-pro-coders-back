const searchService = require('../services/search');

const searchProduct = async (req, res) => {
  const { key } = req.query;
  try {
    const result = await searchService.searchProduct(key);
    console.log(result);
    res.status(200).json({ result });
  } catch (error) {
    console.log(error);
    res.status(error.code);
    res.json({ message: 'No Search Result' });
  }
};

module.exports = { searchProduct };
