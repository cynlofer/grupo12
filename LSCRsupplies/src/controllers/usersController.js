// **** requires **** //
var express = require('express');
var router = express.Router();
var multer = require('multer');
var {path} = require('../app');
var {body, validationResult, check} = require ('express-validator');

const usersController = {
/* GET users listing. */
index: ('/', function(req, res, next) {
    res.send('respond with a resource');
  }),

  /* GET register. */
register: (req, res, next) => {
    res.render('register')
    },
  
//   /* POST register. */
// register: (req, res, next) => {
//     res.redirect('/');
//     },
  
  /* GET user login. */
login: (req, res, next) => {
    res.render('userlogin');
    },
  
//   /* POST user login. */
// login: (req, res, next) => {
//     res.redirect('/');
//   },

  /* GET user edit. */
edit: (req, res, next) => {
    res.render ('useredit');
},

/* POST user edit. */
edit: (req, res, next) => {
    res.redirect ('useredit');
}
}
  module.exports = usersController;
  