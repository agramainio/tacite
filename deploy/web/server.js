const express = require('express');
const path = require('path');

const app = express();
const root = path.join(__dirname, 'dist');

app.disable('x-powered-by');
app.use(express.static(root, { maxAge: '1h', etag: true }));

app.get('*', function (_req, res) {
  res.sendFile(path.join(root, 'index.html'));
});

const port = process.env.PORT || 3000;
app.listen(port, function () {
  console.log('Tacite web listening on ' + port);
});
