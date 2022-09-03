require('dotenv').config();

const http = require('http');
const express = require('express');
const cors = require('cors');

const routes = require('./routes');
<<<<<<< Updated upstream
const { captureRejectionSymbol } = require('events');
const fs = require('fs');
=======
>>>>>>> Stashed changes

const app = express();
app.use(cors());
app.use(express.json());
app.use(routes);

const server = http.createServer(app);
const PORT = process.env.PORT || 8000;
server.listen(PORT, () => {
  const dir = './uploads';
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir);
  }
  console.log(`server start : http://localhost:${PORT}/`);
});
node