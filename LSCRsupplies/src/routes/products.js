// ************ Require's ************
const express = require('express');
const router = express.Router();
var multer = require('multer');
var {path} = require('../app');

/* requeri path para multer */
const path1 = require("path");

var {body} = require ('express-validator');
const productsController = require('../controllers/productsController.js');
const validator = require('../middlewares/validator');


var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path1.join (__dirname, '../../public/images/products'))
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now()+path1.extname(file.originalname))
  }
})
 
var upload = multer({ storage: storage })

/* GET producto listado total*/
router.get('/', productsController.index);
router.get("/sale",productsController.sale);
router.get("/arte",productsController.arte);
router.get("/tecnico",productsController.tecnico);

router.get("/mycart",productsController.mycart);
router.get("/carrito",validator.session,productsController.carrito)
router.post("/payment", productsController.payment)
router.get("/clearCart",productsController.clearCart)
/* ruta a create formulario edicion producto */
router.get('/create', validator.auth, productsController.create); 

/*** CREATE ONE PRODUCT ***/ 
router.post('/', upload.any(),productsController.store); 

/* update producto */
router.put("/:id",upload.any(), productsController.update);

/* detalle de un producto  */
router.get("/:id",productsController.detail)

/* ruta formulario edicion de producto */
router.get("/:id/edit",productsController.edit);

/* ruta accion de borrado */
router.delete("/:id",productsController.destroy);

module.exports = router;
