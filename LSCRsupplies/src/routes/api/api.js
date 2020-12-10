const apiController = require('../../controllers/api/apiController.js');
const express = require('express');
var router = express.Router();

const productsController=require('../../controllers/api/apiController')

router.get('/products',apiController.index);


module.exports=router;
