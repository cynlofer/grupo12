const apiController = require('../../controllers/api/apiController.js');
const express = require('express');
var router = express.Router();
const productsResource = require('../../request/productsResource');

const productsController=require('../../controllers/api/apiController')

router.get('/products',apiController.index);
router.get("/",function(req,res){
    res.status(400)
    res.json({"message": "Use localhost:3000/api/products"})
})


router.get('/banner/products',async(req,res)=>{
    let products = await productsResource.getAll()
    console.log(products);
    res.json(products.data)
})

module.exports=router;
