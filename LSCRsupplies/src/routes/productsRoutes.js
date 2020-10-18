// ************ Require's ************
const express = require('express');
const router = express.Router();
var multer = require('multer');
var {path} = require('../app');
var {body, validationResult, check} = require ('express-validator');

// // ************ Controller Require ************
// const productsController = require('../controllers/productsController');

// /*** GET ALL PRODUCTS ***/ 
// router.get('/', productsController.index); 

// /*** CREATE ONE PRODUCT ***/ 
// router.get('/create/', productsController.create); 
// router.post('/', productsController.store); 

// /*** GET ONE PRODUCT ***/ 
// router.get('/detail/:id/', productsController.detail); 

// /*** EDIT ONE PRODUCT ***/ 
// router.get('/:id/edit', productsController.edit); 
// router.put('/detail/:id', productsController.update); 

// /*** DELETE ONE PRODUCT***/ 
// router.delete('/delete/:id', productsController.destroy); 

// /*** Export Controller */
// module.exports = router;

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join (__dirname, '../public'))
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now()+path.extname(file.originalname))
  }
})
 
var upload = multer({ storage: storage })

/* GET products page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

/* GET productDetail. */
router.get('/productDetail', function(req, res, next) {
  res.render('productDetail');
});

/* GET myCart. */
router.get('/myCart', function(req, res, next) {
  res.render('myCart');
});


module.exports = router;
