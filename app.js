const express = require('express');
const os = require('os');
const app = express();
const port = process.env.PORT || 3000;


app.get('/', (req, res) => {
res.json({
message: 'Hello from aws-devops-sample!',
host: os.hostname(),
time: new Date().toISOString()
});
});


app.get('/health', (req, res) => {
res.status(200).send('OK');
});


app.listen(port, () => {
console.log(`App listening on port ${port}`);
});
