const fs = require('fs');
const path = require('path');
//Sequelize 
const {Product, Brand, Color, Deliverie, Payment, Categorie, Card}= require("../database/models");
const {Op, where} = require('sequelize');
const { validationResult } = require('express-validator');
const { map } = require('../app');
var moment = require('moment');
var sumaCarrito=[];
var pedido= true;      
const controller = {
	// Root - Show all products
	index: async(req, res) => {
		try{
			const titulo = "Todos los Productos";
			const brand = await Brand.findAll();
            const productjson = await Product.findAll({
				order: [["id"]],	  
			});
			let admin = false;
			if(req.session.admin){
				admin = true;
			}
			res.render('homeProducts',{products : productjson, titulo,itemCarrito : req.session.itemCarrito,admin});
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
			let admin = false;
			res.render('homeProducts',{products : productjson, titulo,itemCarrito : req.session.itemCarrito,admin});
	    }catch(error){
            console.log(error);
        }
	},
	arte: async(req, res) => {
		try{
			let admin = false;
			const titulo = "Productos área Artística";
			Product.findAll({
				include: [{
				  model: Categorie,
				  as :"categorias",
				  where: { 
					id: 2
				  },
				  attributes: ['id']
				}]
			  })
			  .then(function(data) {
				res.render('homeProducts',{products : data, titulo,itemCarrito : req.session.itemCarrito,admin});
			  });
	    }catch(error){
            console.log(error);
        }
	},
	tecnico: async(req, res) => {
		try{
			let admin = false;
			const titulo = "Productos área Técnica";
			Product.findAll({
				include: [{
				  model: Categorie,
				  as :"categorias",
				  where: { 
					id: 3
				  },
				  attributes: ['id']
				}]
			  })
			  .then(function(data) {
				res.render('homeProducts',{products : data, titulo,itemCarrito : req.session.itemCarrito,admin});
			  });
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
		carrito={};
		const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
		if(req.session.itemCarrito === 0){
			sumaCarrito=[];
		}
		if (req.session.email != undefined){
				if((req.session.itemCarrito != 0) & ((req.session.carritoActivo) <1)) {
					const datosCarrito = await Card.findAll({  //trae datos de carrito activo pasa a var 
						where : {estado : 0,
							     iduser : req.session.iduser}
					});
					req.session.idPedido = datosCarrito[0].idpedido; //asigna numero carrito session
					//elimina el carrito identificado con ese numero, daros guardados en datosCarrito
					var provCarrito = [];  //inicializa carrito provisorio
					// asigna datos del carrito proveniente de tabla a var provisoria
					datosCarrito.map( element => 
						provCarrito.push({"productid" : element.productid,
						"nombre" : element.nombre,
						"precio" : element.precio,
						"imagen" : element.imagen,
						"iduser" : element.iduser,
						"cantidad" : element.cantidad,
						"fecha" : element.fecha,
						"idpedido" : element.idpedido,
						"estado" : 0})
						)
					sumaCarrito = provCarrito; //asigna array provisoria a sumarrito array general de carrito
					req.session.carritoActivo= 5; // pone un valor diferente de 0 para que no vuelva entrar en if
				}else{
					//entra si no existe un carrito activo y cantidad mayor a 0
					if((pedido) & (req.session.itemCarrito < 1)){
						pedido = false;  //asigna false para q no entre mas al if
						//crea un numero de carrito de 10 caracteres alfanumericos al azar
						function makeid(length) {
							var result           = '';
							var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
							var charactersLength = characters.length;
							for ( var i = 0; i < length; i++ ) {
							result += characters.charAt(Math.floor(Math.random() * charactersLength));
							}
							return result;
						}
						req.session.idPedido = makeid(10); //asigna numero de carrito inicial a session
						req.session.carritoActivo= 5;  //para que o ingrese al if principal
					};
				};
				//guarda con los datos del formulario detalle posible item de carrito
				req.session.carritoActivo= 6;
				req.session.itemNew= 1;
				carrito = { 
				productid: Number(prod_detal.id),
				nombre : prod_detal.name,
				precio : Number(prod_detal.price),
				imagen : prod_detal.images,
				iduser : Number(req.session.iduser),
				cantidad : 1,
				fecha : new Date(),
				idpedido : req.session.idPedido,
				estado : 0
			};
		    
		}else{
			sumaCarrito=[];
			
		};
		res.render('productDetail',{producto : prod_detal, admin,itemCarrito : req.session.itemCarrito, alerta: req.session.email});
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
				res.render ('products/productUp',{productToEdit : productToEdit,brand,colores,payment,shipping ,itemCarrito : req.session.itemCarrito});
			}else{
				res.render ('userlogin',{itemCarrito : req.session.itemCarrito});
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
				res.render("products/productsEdit", {productToEdit : productToEdit,brand,colores,payment,shipping,categorie ,itemCarrito : req.session.itemCarrito});
			}else{
				const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
				res.render('productDetail',{producto : prod_detal, errorMsg: "Su usuario no es Administrador",itemCarrito : req.session.itemCarrito,alerta: req.session.email});
			}

		}catch(error){
			console.log(error);
		}
	},
	// Update - Method to update
	update: async(req, res) => {
		try{
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
				const prod_detal = await Product.findByPk(req.params.id,{include:{all:true}});
				res.render('productDetail',{producto : prod_detal, errorMsg: "Su usuario no es Administrador",itemCarrito : req.session.itemCarrito,alerta: req.session.email});
			}
		}catch(error){
            console.log(error);
        }
	},
	// carrito de compras
	mycart :async (req, res) => {
		try {
			if (req.session.email != undefined){
				var subtotal = 0;
				if(req.session.itemCarrito != 0) {
					const datosCart = await Card.findAll({  //trae datos de carrito activo pasa a var 
						where : {estado : 0,
							     iduser : req.session.iduser}
					});
					if(datosCart.length>0){
						req.session.idPedido = datosCart[0].idpedido; //asigna numero carrito session
						//elimina el carrito identificado con ese numero, datos guardados en datosCarrito
						await Card.destroy({
							where :{idpedido : req.session.idPedido,
									 iduser : req.session.iduser},
							force : true 
						});
						var provCarrito = [];  //inicializa carrito provisorio
						// asigna datos del carrito proveniente de tabla a var provisoria
						datosCart.map( element => 
							provCarrito.push({
							"productid" : element.productid,
							"nombre" : element.nombre,
							"precio" : element.precio,
							"imagen" : element.imagen,
							"iduser" : element.iduser,
							"cantidad" : element.cantidad,
							"fecha" :  element.fecha,
							"idpedido" : element.idpedido,
							"estado" : 0})
						)
						sumaCarrito = provCarrito; //asigna array provisoria a sumarrito array general de carrito
						req.session.carritoActivo= 5; // pone un valor diferente de 0 para que no vuelva entrar en if
						var newLocal = await Card.bulkCreate(sumaCarrito);
					};
				};
				sumaCarrito.forEach((carrito)=>{
					subtotal = carrito.precio + subtotal;
				});
				res.render("myCart",{carrito : sumaCarrito, subtotal,itemCarrito : req.session.itemCarrito});
			}else{
				res.render("userlogin",{itemCarrito : req.session.itemCarrito});
			}
		} catch (error) {
			console.log(error);
		}
	},
	carrito : async(req, res) => {
			resultado = validationResult(req);
			if (req.session.email != undefined){
				var resultad = sumaCarrito.find(element=> element.productid === carrito.productid);
				if(resultad){
					var changedCart= await Card.findAll({  //trae datos de carrito activo pasa a var 
						where : {productid : resultad.productid,
									iduser : req.session.iduser,
									estado :0
								}
					});
					if(changedCart.length>0){
						await Card.update({
							cantidad: changedCart[0].cantidad+1,
						}, {
							where: {
								    productid : changedCart[0].productid,
									iduser : req.session.iduser,
									estado :0
							}
						});
					}
					sumaCarrito.map(element =>{
						if(element.productid === carrito.productid){
							element.cantidad = element.cantidad+1;
						}
					})
				}else{
					req.session.itemCarrito = req.session.itemCarrito +1;
					sumaCarrito.push(carrito);
					const newCart = await Card.create(carrito);
				}
			}else{
				console.log(" no esta logueado");
			};
			res.redirect("/products/");	
	},
	payment : async(req, res) => {
		try {
			const changedProd = await Card.findAll({
				where: {estado : 0,
					idpedido : req.session.idPedido}
			});
			for (let i = 0; i < changedProd.length; i++) {
				await Card.update({
					estado : 1},
					{where : {idpedido : req.session.idPedido}
				});
			};
			await Card.destroy({
				where :{idpedido : req.session.idPedido,
						iduser : req.session.iduser,
						cantidad :0
				},
				force : true 
			});		
			carrito= {};
			sumaCarrito =[];
			pedido= true; 
			req.session.carritoActivo = 0;
			req.session.itemCarrito =0;
			res.redirect("/");
		} catch (error) {
			
		}	
    },
	clearCart :async (req, res) => {
		try {
			
			carrito= {};
			sumaCarrito =[];
			await Card.destroy({
				where :{ idpedido : req.session.idPedido,
					iduser : req.session.iduser},
					force : true 
				});
				req.session.itemCarrito =0;
				req.session.carritoActivo=0;
			    pedido= true; 
				res.redirect("/");
			} catch (error) {
				
			}
			
    }
};

module.exports = controller;