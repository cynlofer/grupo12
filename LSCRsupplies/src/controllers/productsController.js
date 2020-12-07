const fs = require('fs');
const path = require('path');
//Sequelize 
const {Product, Brand, Color}= require("../database/models");
const {Op} = require('sequelize');
//const { send } = require('process');
//const {validationResult} = require ("express-validator");

const controller = {
	// Root - Show all products
	index: async(req, res) => {
		try{
			const brand = await Brand.findAll();
            const productjson = await Product.findAll({
                order: [["id"]],
			});
			res.render('homeProducts',{products : productjson});
			            
        }catch(error){
            console.log(error);
        }
		
	},

	// Detail - Detail from one product
	detail: async(req, res) => {
	try{
		const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
		res.send(prod_detal);
		//res.render('productDetail',{producto : prod_detal});
		
		
	}catch(error){
		console.log(error);
	}
	},
	// create - Form to Edit
	create: (req, res) => {
		res.render ('products/productUp');
	},

	// Create -  Method to store
	store: async(req, res) => { 
		console.log(req.files);
		let selectedProd1 = Product.findByPk(req.params.id);
		imag1 = selectedProd1.images;
		imag2=selectedProd1.image2;
		imag3 =selectedProd1.image3;
		imag4=selectedProd1.image4;
		if(req.files != ""){
			console.log("existe req files");
			for(i=0 ; i < req.files.length ; i++){
				if(i==0){
					imag1 = req.files[i].filename;
					console.log(imag1);
				}else if(i==1){
					imag2 = req.files[i].filename;
				}else if(i==2){
					imag3 = req.files[i].filename;
				}else if(i==3){
					imag4 = req.files[i].filename;
				}
			}
		}
		const newProduct = await Product.create(req.body);
		console.log(newProduct);
		await newProduct.update(
			{ images: imag1 }, //what going to be updated
			{ where: { id: (newProduct.id) }})
		res.redirect("/products/create");
	},

	// Update - Form to edit
	edit: async(req, res) => {
		try{
			const productToEdit = await Product.findByPk(req.params.id);
			res.render("products/productsEdit", {productToEdit : productToEdit});
			
		}catch(error){
			console.log(error);
		}
		
	},
	// Update - Method to update
	update: async(req, res) => {
		try{
        console.log(req.files);
		let selectedProd1 = Product.findByPk(req.params.id);
		imag1 = selectedProd1.images;
		imag2=selectedProd1.image2;
		imag3 =selectedProd1.image3;
		imag4=selectedProd1.image4;
		if(req.files != ""){
			console.log("existe req files");
			for(i=0 ; i < req.files.length ; i++){
				if(i==0){
					imag1 = req.files[i].filename;
					console.log(imag1);
				}else if(i==1){
					imag2 = req.files[i].filename;
				}else if(i==2){
					imag3 = req.files[i].filename;
				}else if(i==3){
					imag4 = req.files[i].filename;
				}
			}
		}
			const changedProduct = await Product.findByPk(req.params.id);
			let ver = req.body;
			await changedProduct.update(req.body);
			await changedProduct.update(
				{ images: imag1 }, //what going to be updated
				{ where: { id: req.params.id }})
			res.redirect("/");
           
            
        }catch(error){
            console.log(error);
        }
	},

	// Delete - Delete one product from DB
	destroy : async(req, res) => {
		try{
            const toDelete = await Product.findByPk(req.params.id);
            await toDelete.destroy();
            res.redirect("/"); 
            
        }catch(error){
            console.log(error);
        }

	},
	// carrito de compras
	mycart : (req, res) => {
		res.render("myCart");
	}	
};

module.exports = controller;