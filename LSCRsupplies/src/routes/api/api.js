const apiController = require('../../controllers/api/apiController.js');
const express = require('express');
var router = express.Router();
const productsResource = require('../../request/productsResource');

const productsController=require('../../controllers/api/apiController')

router.get('/products',apiController.index);
router.get('/card',apiController.card);
router.get('/products/brands',apiController.brands);
router.get("/",function(req,res){
    res.status(400)
    res.json({"message": "Use localhost:3000/api/products"})
});
router.post("/product/prueba",(req,res)=>{
    console.log("en api de routes");
});
router.get('/products/categorias',apiController.categorias);

router.post('/card',apiController.postCarrito);

router.get('/brands',async(req,res)=>{
    let products = await productsResource.getAll("/products/brands")
    //console.log(products);
    res.json(products.data)
})
module.exports=router;
