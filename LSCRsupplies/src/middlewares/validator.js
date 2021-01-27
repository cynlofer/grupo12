const {body} = require("express-validator");
var path = require("path");
const Swal = require('sweetalert2');
module.exports= {
    usuario: [
        /* body("first_name")
            .notEmpty()
            .withMessage("El nombre es obligatorio"),
            

        body("last_name")
            .notEmpty()
            .withMessage("El Apellido es obligatorio"),
            
        body("email")
            .isEmail()  
            .withMessage("El campo no es un email"),
         */
        body("email")
            .isEmail()  
            .withMessage("El campo no es un email"),
            
        body("imagen")
            .custom(function(value,{req}){
                const acceptedExtensions = [".jpg", ".jpeg", ".png", ".svg"];
                const ext = path.extname(req.file.originalname)
                return acceptedExtensions.includes(ext);
            })
            .withMessage("El archivo no es valido")
            
    ],
    auth :[
        body("email")
        .custom(function(value,{req},res,next){
            if (req.session.admin){
                return true;
            }else{
                console.log("no admin");
                return false;
            }
        })
        .withMessage("No es Administrador")  
    ],
    session :[
        body("email")
        .custom(function(value,{req},res,next){
            if (req.session.email){
                console.log("validatos logueado");
                return true;
            }else{
                console.log("validatos no  logueado")
                
                return false;
            }
        })
        .withMessage("Debes loguearte para activar carrito de compras")  
    ]

};