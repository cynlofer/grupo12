const {sequelize,DataTypes, Sequelize}= require("sequelize");
var moment = require('moment');
module.exports =(sequelize,DataTypes)=>{
    const Product = sequelize.define("Product",{
        name : DataTypes.STRING,
        descripcion : DataTypes.STRING,
        images : DataTypes.STRING,
        brand_id: DataTypes.INTEGER,
        price : DataTypes.INTEGER,
        codigo : DataTypes.INTEGER,
        stock : DataTypes.INTEGER,
        promocion : DataTypes.INTEGER
    }, 
    {
        timestamps: false
    })
    Product.associate = (models =>{
    Product.belongsTo(models.Brand);
    Product.belongsToMany(models.Color,{
        as: "colores",
        through : "color_products"
    })
    Product.belongsToMany(models.Payment,{
        as: "metodoPago",
        through : "payments_products"
    })
    Product.belongsToMany(models.Deliverie,{
            as: "shipping",
            through : "deliveries_products"
    })
    Product.belongsToMany(models.Categorie,{
        as: "categorias",
        through : "categories_products"
    })
    })
    return Product;
    }