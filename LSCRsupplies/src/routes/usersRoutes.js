// ************ Require's ************
const express = require('express');
const router = express.Router();
var multer = require('multer');
var {path} = require('../app');
var {body, validationResult, check} = require ('express-validator');
const path1 = require("path");

// ************ Controller Require ************
const usersController = require('../controllers/usersController');
const validator = require('../middlewares/validator');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, path1.join (__dirname, '../../public/images/users'))
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now()+path1.extname(file.originalname))
    }
  })
   
  var upload = multer({ storage: storage,
    fileFilter: (req, file, cb)=>{
      const acceptedExtensions = [".jpg", ".jpeg", ".png", ".svg"];
      const ext = path1.extname(file.originalname);
      if (!acceptedExtensions.includes(ext)){
        req.file= file;
      }
      cb(null, acceptedExtensions.includes(ext));
    },
  });
  

// ************ Available Routes ************

// router.get('/', usersController.index); // Main /users 

router.get('/register', usersController.register); // User registration *GET*
router.post('/register', upload.single("imagen"), validator.usuario, usersController.saveUser); // User registration *POST*

router.get('/userlogin', usersController.login); // User login *GET*
router.post('/userlogin', validator.auth, usersController.processLogin); // User login *POST*


router.get ('/edit/:id', usersController.edit) // User edit *GET* 
router.put ('/edit/:id', usersController.actualizar) // User edit *PUT* 

//link Preguntas frecuentes
router.get('/preguntasFrecuentes',usersController.view)//muestra preguntas frecuentes

//Logout
router.get("/logout",usersController.logout) //cierra session

module.exports = router;

