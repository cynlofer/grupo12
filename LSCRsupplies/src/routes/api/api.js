const apiController = require('../../controllers/api/apiController.js');
const express = require('express');
var router = express.Router();

const productsController=require('../../controllers/api/apiController')

router.get('/products',apiController.index);
router.get("/",function(req,res){
    res.status(400)
    res.json({"message": "Use localhost:3000/api/products"})
})


module.exports=router;
