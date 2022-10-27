const express = require('express');
const db = require('./database/db');
const routes = require('./routes');
const handleError = require('./middlewares/handleError');
const app = express();

db.hasConection();

app.use(express.json());
app.use(routes);
app.use(handleError);

app.listen(3000, () => console.log('Servidor started: 3000'));
