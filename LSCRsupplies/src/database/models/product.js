const {sequelize,DataTypes, Sequelize}= require("sequelize");
var moment = require('moment');
module.exports =(sequelize,DataTypes)=>{
    const Product = sequelize.define("Product",{
        name : DataTypes.STRING,
        descripcion : DataTypes.STRING,
        images : DataTypes.STRING,
        brands_brandid: DataTypes.INTEGER
    }, 
    {
        timestamps: false
    })
    // Product.associate = (models =>{
    //     Product.hasMany(models.Brand);
    // })
    return Product;
    }