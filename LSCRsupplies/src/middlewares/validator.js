const {body} = require("express-validator");
var path = require("path");
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
        body("imagen")
            .custom(function(value,{req}){
                const acceptedExtensions = [".jpg", ".jpeg", ".png", ".svg"];
                const ext = path.extname(req.file.originalname)
                return acceptedExtensions.includes(ext);
            })
            .withMessage("El archivo no es valido")
            
    ]   

};