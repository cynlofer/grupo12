// ************ Require's ************
const express = require('express');
const router = express.Router();
var multer = require('multer');
var {path} = require('../app');
var {body, validationResult, check} = require ('express-validator');

// ************ Controller Require ************
const usersController = require('../controllers/usersController');

// ************ Available Routes ************

router.get('/', usersController.index); // Main /users 

router.get('/register', usersController.register); // User registration *GET*
router.post('/users/register', usersController.register); // User registration *POST*

router.get('/userlogin', usersController.login); // User login *GET*
router.post('/userlogin', usersController.processLogin); // User login *POST*

router.get ('/users/edit/:id', usersController.edit) // User edit *GET*
router.put ('/users/edit/:id', usersController.edit) // User edit *PUT*

module.exports = router;