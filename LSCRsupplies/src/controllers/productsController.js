const fs = require('fs');
const path = require('path');
//Sequelize 
const {Product, Brand, Color, Deliverie, Payment, Categorie}= require("../database/models");
const {Op, where} = require('sequelize');
const { validationResult } = require('express-validator');

const controller = {
	// Root - Show all products
	index: async(req, res) => {
		try{
			const titulo = "Todos los Productos";
			const brand = await Brand.findAll();
            const productjson = await Product.findAll({
				order: [["id"]],
				
				  
			});
			
			res.render('homeProducts',{products : productjson, titulo});
	    }catch(error){
            console.log(error);
        }
	},
	sale: async(req, res) => {
		try{
			const titulo = "Productos en Oferta";
			const brand = await Brand.findAll();
            const productjson = await Product.findAll({
				order: [["id"]],
				where : {[Op.not]: [{promocion : 0 }]} 	
			});
			//console.log(productjson);
			res.render('homeProducts',{products : productjson, titulo});
	    }catch(error){
            console.log(error);
        }
	},
	arte: async(req, res) => {
		try{
			//const titulo = "Productos en Oferta";
			//const categorie = await Categorie.findAll();
			const productjson = await Product.findAll({include: [{ 
				model : categorias, 
				where: {id: 2}, 
				attributes: ['id'] 
			   }] })
			//res.send(productjson[5].categorias[0].name);
					
		 
			res.send(productjson);
			//res.render('homeProducts',{products : productjson, titulo});
	    }catch(error){
            console.log(error);
        }
	},
	tecnico: async(req, res) => {
		try{
			const titulo = "Productos en Oferta";
			const brand = await Brand.findAll();
            const productjson = await Product.findAll({
				order: [["id"]],
				where : {[Op.not]: [{promocion : null}]} 	
			});
			//console.log(productjson);
			res.render('homeProducts',{products : productjson, titulo});
	    }catch(error){
            console.log(error);
        }
	},

	// Detail - Detail from one product
	detail: async(req, res) => {
	try{
		let admin = false;
		if(req.session.admin){
			admin = true;
		}
		const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
		res.render('productDetail',{producto : prod_detal, admin});
	}catch(error){
		console.log(error);
	}
	},
	// create - Form to Edit
	create: async(req, res) => {
		try{
			resultado = validationResult(req);
			if(resultado.isEmpty()){
				const productToEdit = await Product.findByPk(req.params.id,{include:{all:true}});
				const brand = await Brand.findAll();
				const colores= await Color.findAll();
				const payment= await Payment.findAll();
				const shipping = await Deliverie.findAll();
				res.render ('products/productUp',{productToEdit : productToEdit,brand,colores,payment,shipping });
			}else{
				res.render ('userlogin');
			}
			}catch(error){
			console.log(error);
		}
		
	},

	// Create -  Method to store
	store: async(req, res) => { 
		let selectedProd1 = Product.findByPk(req.params.id);
		imag1 = selectedProd1.images;
		imag2=selectedProd1.imagesq;
		imag3 =selectedProd1.images2;
		imag4=selectedProd1.images3;
		if(req.files != ""){
			console.log("existe req files");
			for(i=0 ; i < req.files.length ; i++){
				if(i==0){
					imag1 = req.files[i].filename;
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
		await newProduct.addColores(req.body.colores);
		await newProduct.addMetodoPago(req.body.metodoPago);
		await newProduct.addShipping(req.body.shipping);
		await newProduct.update(
			{ images: imag1 }, //what going to be updated
			{ where: { id: (newProduct.id) }})
		res.redirect("/products/create");
	},

	// Update - Form to edit
	edit: async(req, res) => {
		try{
			if (req.session.admin){
				const productToEdit = await Product.findByPk(req.params.id,{include:{all:true}});
				const brand = await Brand.findAll();
				const colores= await Color.findAll();
				const payment= await Payment.findAll();
				const shipping = await Deliverie.findAll();
				const categorie = await Categorie.findAll();
				res.render("products/productsEdit", {productToEdit : productToEdit,brand,colores,payment,shipping,categorie });
			}else{
				const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
				res.render('productDetail',{producto : prod_detal, errorMsg: "Su usuario no es Administrador"});
			}
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
				}else if(i==1){
					imag2 = req.files[i].filename;
				}else if(i==2){
					imag3 = req.files[i].filename;
				}else if(i==3){
					imag4 = req.files[i].filename;
				}
			}
		}
			const changedProduct = await Product.findByPk(req.params.id,{include:{all:true}});
			await changedProduct.removeColores(changedProduct.colores);
			await changedProduct.addColores(req.body.colores);
			await changedProduct.removeCategorias(changedProduct.categorias);
			await changedProduct.addCategorias(req.body.categorias);
			await changedProduct.removeMetodoPago(changedProduct.metodoPago);
			await changedProduct.addMetodoPago(req.body.metodoPago);
			await changedProduct.removeShipping(changedProduct.shipping);
			await changedProduct.addShipping(req.body.shipping);
			await changedProduct.update(req.body);
			await changedProduct.update(
				{ images: imag1,
				  images1 : imag2,
				  images2 : imag3,
				  images3 : imag4
				}, //what going to be updated
				{ where: { id: req.params.id }})
			res.redirect("/");
        }catch(error){
            console.log(error);
        }
	},

	// Delete - Delete one product from DB
	destroy : async(req, res) => {
		try{
			if (req.session.admin){
				const toDelete = await Product.findByPk(req.params.id,{include:{all:true}});
				await toDelete.removeColores(toDelete.colores);
				await toDelete.removeMetodoPago(toDelete.metodoPago);
				await toDelete.removeShipping(toDelete.shipping);
				await toDelete.destroy();
				res.redirect("/"); 
			}else{
				//res.render("products/productsEdit", {allData: newUser, errorMsg: " La contraseña es incorrecta"});
				const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
				res.render('productDetail',{producto : prod_detal, errorMsg: "Su usuario no es Administrador"});
			}
		}catch(error){
            console.log(error);
        }
	},
	// carrito de compras
	mycart : (req, res) => {
		if (req.session.email){
			console.log(req.body);
			res.render("myCart");
		}else{
			res.render("userlogin");
		}
	}	
};

module.exports = controller;