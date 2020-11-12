const fs = require('fs');
const path = require('path');

const productsFilePath = path.join(__dirname, '../data/productsDataBase.json');
const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));

const controller = {
	// Root - Show all products
	index: (req, res) => {
		res.render('homeProducts',{products : products});
	},

	// Detail - Detail from one product
	detail: (req, res) => {
	var prod_detal = products[req.params.id-1];
	res.render('productDetail',{producto : prod_detal});
	},
	// create - Form to Edit
	create: (req, res) => {
		res.render ('products/productUp');
	},

	// Create -  Method to store
	store: (req, res) => { 
		var selectedProd1=products;
		console.log("en store");
		var imag1 = "";
		var imag2="";
		var imag3 ="";
		var imag4="";
		if(req.files != ""){
			
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
		let new_producto = {
			id: products[products.length-1].id+1,
			name : req.body.name,
			codArt : Number(req.body.codArt),
			stock : Number(req.body.stock),
			price : Number(req.body.price),
			price_prom : Number(req.body.price_prom),
			description : req.body.description,
			peso : Number(req.body.peso),
			profundidad : Number(req.body.profundidad),
			ancho : Number(req.body.ancho),
			alto : Number(req.body.alto),
			shipping : req.body.shipping,
			envio : req.body.envio,
			arteypintura : req.body.arteypintura,
			escritura : req.body.escritura,
			color1 : req.body.color1,
			color2 : req.body.color2,
			color3 : req.body.color3,
			color4 : req.body.color4,
			color5 : req.body.color5,
			color6 : req.body.color6,
			material1 : req.body.material1,
			material2 : req.body.material2,
			material3 : req.body.material3,
			material4 : req.body.material4,
			material5 : req.body.material5,
			material6 : req.body.material6,
			marca1 : req.body.marca1,
			marca2 : req.body.marca2,
			marca3 : req.body.marca3,
			marca4 : req.body.marca4,
			marca5 : req.body.marca5,
			marca6 : req.body.marca6,
			image1 : imag1,
			image2 : imag2,
			image3 : imag3,
			image4 : imag4
		}
		selectedProd1.push(new_producto);
		fs.writeFileSync(productsFilePath, JSON.stringify(selectedProd1, null, 2));
		res.redirect("/products/create");
	},

	// Update - Form to edit
	edit: (req, res) => {
		var productToEdit = products[req.params.id-1];
		res.render("products/productsEdit", {productToEdit : productToEdit});
	},
	// Update - Method to update
	update: (req, res) => {
		
		let codigo1 = req.params.id;
		console.log(codigo1);
		let selectedProd1 = products.find(producto => producto.id == codigo1);
		console.log("en update");
		imag1 = selectedProd1.image1;
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

		let updProduct = {
			id: Number(selectedProd1.id),
			name : req.body.name,
			codArt : Number(codigo1),
			stock : Number(req.body.stock),
			price : Number(req.body.price),
			price_prom : Number(req.body.price_prom),
			description : req.body.description,
			peso : Number(req.body.peso),
			profundidad : Number(req.body.profundidad),
			ancho : Number(req.body.ancho),
			alto : Number(req.body.alto),
			shipping : req.body.shipping,
			envio : req.body.envio,
			arteypintura : req.body.arteypintura,
			escritura : req.body.escritura,
			color1 : req.body.color1,
			color2 : req.body.color2,
			color3 : req.body.color3,
			color4 : req.body.color4,
			color5 : req.body.color5,
			color6 : req.body.color6,
			material1 : req.body.material1,
			material2 : req.body.material2,
			material3 : req.body.material3,
			material4 : req.body.material4,
			material5 : req.body.material5,
			material6 : req.body.material6,
			marca1 : req.body.marca1,
			marca2 : req.body.marca2,
			marca3 : req.body.marca3,
			marca4 : req.body.marca4,
			marca5 : req.body.marca5,
			marca6 : req.body.marca6,
			image1 : imag1,
			image2 : imag2,
			image3 : imag3,
			image4 : imag4
		} 
		
		
		products[selectedProd1.id-1]= updProduct;
		/* console.log(products); */
		fs.writeFileSync(productsFilePath, JSON.stringify(products, null, 2)); 
		res.redirect("/products/" + req.params.id + "/edit");
	},

	// Delete - Delete one product from DB
	destroy : (req, res) => {
		let idToDelete = req.params.id;
		console.log(idToDelete);

		/* let updatedDB = products.filter(product => product.id != idToDelete); */
		var updatedDB = products;
		updatedDB.splice(idToDelete-1,1);
		for(i=idToDelete ;i <=updatedDB.length;i++){
			updatedDB[i-1].id=Number(i);
		}
		console.log(updatedDB);
		fs.writeFileSync(productsFilePath, JSON.stringify(updatedDB,null,2));
		res.redirect("/");
	},
	// carrito de compras
	mycart : (req, res) => {
		res.render("myCart");
	}	
};

module.exports = controller;