// **** requires **** //
var express = require('express');
const router = express.Router();
var multer = require('multer');
var {path} = require('../app');
var {body, validationResult, check} = require ('express-validator');
// ************ Controller Require ************
const mainController = require('../controllers/mainController');


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
router.get('/', mainController.index);



module.exports = router;
