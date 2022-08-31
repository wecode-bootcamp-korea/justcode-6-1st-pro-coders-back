const express = require('express');
//const uploadController = require('../controllers/upload');
const router = express.Router();
const multer = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads');
  },
  filename: function (req, file, cb) {
    cb(null, file.fielfname + '-' + Date.now());
  },
});

const upload = multer({ storage: storage });

router.post('/', upload.single('file'), (req, res, next) => {
  res.status(200).send({ message: 'OK', fileInfo: req.file });
});
router.post('/multipart', upload.array('file'), (req, res, next) => {
  //check
  req.files.map(data => {
    console.log(data);
  });

  res.status(200).send({ message: 'OK', fileInfo: req.files });
});

module.exports = router;
