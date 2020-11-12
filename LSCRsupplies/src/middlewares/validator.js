const {body} = require("express-validator");
var path = require("path");
module.exports= {
    image: [
        body("image")
            .custom(function(value,{req}){
                console.log("en midd validator");   
                
            })
        
    ]
};