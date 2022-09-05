const http = require('http');
const express = require('express');
const router = require('./routes');
const morgan = require('morgan');
const cors = require('cors');

const createApp = () => {
  const app = express();
  app.use(cors());
  app.use(express.json());
  app.use(router);

  app.get('/ping', function (req, res, next) {
    res.json({ message: 'pong' });
  });

  return app;
};

module.exports = { createApp };
