const searchService = require('../services/search');

const searchProduct = async (req, res) => {
  const { query } = req.query;
  console.log(query);
  const result = await searchService.searchProduct(query);
  console.log(result);
  if (!result[0]) {
    res.status(500).json({ message: 'No search result' });
  } else {
    res.status(200).json({ result });
  }
};

module.exports = { searchProduct };
