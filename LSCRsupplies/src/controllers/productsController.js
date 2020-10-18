const fs = require('fs');
const path = require('path');

const productsFilePath = path.join(__dirname, '../data/productsDataBase.json');
const products = JSON.parse(fs.readFileSync(productsFilePath, 'utf-8'));

const controller = {
	// Root - Show all products
	index: (req, res) => {
		res.render('products', {products, toThousand});
	},

	// Detail - Detail from one product
	detail: (req, res) => {
		let idProduct = req.params.id;
		let selectedProd = products.find(producto => producto.id == idProduct);
		res.render('detail', {selectedProd, toThousand});
	},

	// Create - Form to create
	create: (req, res) => {
		res.render ('product-create-form');
	},
	
	// Create -  Method to store
	store: (req, res) => { 
		let newProduct = { //tambien se puede usar la sintaxis "...req.body" que trae todos las propiedades del body
			id: Number(products[products.length-1].id+1),
			name: req.body.name,
			price: Number(req.body.price),
			discount: Number(req.body.discount),
			description: req.body.description,
			category: req.body.category
		}
		let newDB = [...products, newProduct]
		fs.writeFileSync(productsFilePath, JSON.stringify(newDB, null, 2));
		res.send('Producto creado satisfactoriamente');
	},

	// Update - Form to edit
	edit: (req, res) => {
		let idProduct = req.params.id;
		let selectedProd = products.find(producto => producto.id == idProduct);
		res.render('product-edit-form', {selectedProd});
	},
	// Update - Method to update
	update: (req, res) => {
		let idProduct = req.params.id;
		let oldProduct = products.find(producto => producto.id == idProduct);
		let updProduct = {
			id: Number(req.params.id),
			name: req.body.name,
			price: Number(req.body.price),
			discount: Number(req.body.discount),
			description: req.body.description,
			category: req.body.category,
			image: oldProduct.image,
		}
		let productIndex = products.indexOf(oldProduct);
		products[productIndex] = updProduct;
		fs.writeFileSync(productsFilePath, JSON.stringify(products, null, 2));
		res.send('Producto editado satisfactoriamente');
	},

	// Delete - Delete one product from DB
	destroy : (req, res) => {
		let idToDelete = req.params.id;
		console.log(idToDelete);

		let updatedDB = products.filter(product => product.id != idToDelete);

		fs.writeFileSync(productsFilePath, JSON.stringify(updatedDB));

		res.send ('Producto borrado satisfactoriamente')
	}	
};

module.exports = controller;