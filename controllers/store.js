const storeService = require('../services/store');

const getStore = async (req, res) => {
  try {
    const result = await storeService.getStore();
    res.status(200).json(result);
  } catch (error) {
    console.log(error);
    res.status(error.code).json(error.message);
  }
};

module.exports = { getStore };
