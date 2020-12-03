const {sequelize,DataTypes, Sequelize}= require("sequelize");
var moment = require('moment');
module.exports =(sequelize,DataTypes)=>{
    const Product = sequelize.define("Product",{
        name : DataTypes.STRING,
        descripcion : DataTypes.STRING,
        images : DataTypes.STRING,
        Brands_brandid: DataTypes.INTEGER,
        Clasifications_clasificationid : DataTypes.INTEGER,
        price : DataTypes.INTEGER
    }, 
    {
        timestamps: false
    })
   /*  Product.associate = (models =>{
    Product.belongsTo(models.Brand);
    }) */
    return Product;
    }