const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const PORT = 3000;

const users = [
    {
        "id": 1,
        "image": null,
        "userName": "user1",
        "password": 12345,
        "fullName": "User One",
        "email": "user1@example.com",
        "phoneNumber": "1234567890",
        "accessLivingroom": true,
        "accessKitchen": false,
        "accessBedroom": true,
        "accessToilet": false,
        "ishost": true,
        "blocked": false,
        "deleted": false
      },{
        "id": 2,
        "image": null,
        "userName": "user2",
        "password": 12345,
        "fullName": "User two",
        "email": "user2@example.com",
        "phoneNumber": "1234567890",
        "accessLivingroom": true,
        "accessKitchen": false,
        "accessBedroom": true,
        "accessToilet": false,
        "ishost": false,
        "blocked": true,
        "deleted": false
      }
];

app.use(bodyParser.json());

app.get('/users/:userName', (req, res) => {
  const userName = req.params.userName;
  const user = users.find(u => u.userName === userName);

  if (user) {
    res.json(user);
  } else {
    res.status(404).json({ error: 'User not found' });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});