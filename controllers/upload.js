const { application } = require('express');
const multer = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads');
  },
  filename: function (req, file, cb) {
    cb(null, file.fielfname + '-' + Data.now());
  },
});

const upload = multer({ storage: storage });

const singleUpload = app.post('/', upload.single('img'), (req, res, next) => {
  res.status(200).send({ message: 'OK', fileInfo: req.file });
});

const multiUpload = app.post(
  '/multipart',
  upload.array('img'),
  (req, res, next) => {
    //check
    req.files.map(data => {
      console.log(data);
    });

    res.status(200).send({ message: 'OK', fileInfo: req.files });
  }
);

module.exports = { singleUpload, multiUpload };
