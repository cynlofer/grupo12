var express = require('express');
var router = express.Router();
var multer = require('multer');
var {path} = require('../app');
var {body, validationResult, check} = require ('express-validator');

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join (__dirname, '../public'))
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now()+path.extname(file.originalname))
  }
})
 
var upload = multer({ storage: storage })

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET productDetail. */
router.get('/productDetail', function(req, res, next) {
  res.render('productDetail');
});

/* GET register. */
router.get('/register', function(req, res, next) {
  res.render('register');
});

/* POST register. */
router.post('/register', upload.any(), function(req, res, next) {
  res.redirect('/');
});

/* GET myCart. */
router.get('/myCart', function(req, res, next) {
  res.render('myCart');
});


module.exports = router;
