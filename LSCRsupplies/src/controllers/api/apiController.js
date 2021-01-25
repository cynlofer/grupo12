
const {Product, Brand, Color, Deliverie, Payment, salesDetail, Card}= require("../../database/models");

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
        }

    }catch(error){
        console.log(error);
    }
},
prueba: async(req, res) => {
    try{
        console.log("api prueba");
        console.log(req.body);
        }
    catch(error){
        console.log(error);
    }

},
card: async(req, res) => {
    try{
        
        const productjson = await Card.findAll({
            
            order: [["id"]],
            where :{

            }
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
            
        }

    }catch(error){
        console.log(error);
    }

},
postCarrito: async(req,res)=>{
    try {
        const  datosApi = req.body;
        //console.log(datosApi);
        if(datosApi != []){

            const prodPedido = await Card.findAll({
                where : {idpedido : datosApi[0].idpedido, }	
            });
            //console.log("en api"+prodPedido);
            for (let i = 0; i < datosApi.length; i++) {
                for (let x = 0; x < prodPedido.length; x++) {
                    if(prodPedido[x].productid === datosApi[i].productid){
                        //console.log("entre actualiza");
                        await Card.update({
                            cantidad : datosApi[i].cantidad
                        },{where : {productid : datosApi[i].productid}})
                    }                
                } 
            }
        }else{
            console.log("array vacio");
        }
    } catch (error) {
        console.log(error);
    }
}
};

module.exports = controller;