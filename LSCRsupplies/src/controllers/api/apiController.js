
const {Product, Brand, Color, Deliverie, Payment}= require("../../database/models");

const controller = {
index: async(req, res) => {
    try{
        const productjson = await Product.findAll({
            //order: [["id"]]
        });
        if (productjson.length >0) {
            let respuesta = {
            metadata:{
              status:200,
              cantidad:productjson.length
            },
            resultados:productjson
            
        }
        res.json(respuesta);
    }
//console.log(respuesta);
        
    }catch(error){
        console.log(error);
    }
},
};

module.exports = controller;