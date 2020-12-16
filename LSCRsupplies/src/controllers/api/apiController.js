
const {Product, Brand, Color, Deliverie, Payment, salesDetail}= require("../../database/models");

const controller = {
index: async(req, res) => {
    try{
        const productjson = await Product.findAll({
            order: [["id"]]
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
        }else{
            res.status(400)
            res.json({"message": "Tabla vacia"}) 
            //res.status(204).send(); //no envia mensaje codigo 204
            
        }

    }catch(error){
        console.log(error);
    }
},
brands : async(req, res) => {
    try{
        const productjson = await Brand.findAll({
            order: [["id"]]
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
        }else{
            res.status(400)
            res.json({"message": "Tabla vacia"}) 
            //res.status(204).send(); //no envia mensaje codigo 204
            
        }

    }catch(error){
        console.log(error);
    }
}
};

module.exports = controller;