const {sequelize,DataTypes, Sequelize}= require("sequelize");
var moment = require('moment');
module.exports =(sequelize,DataTypes)=>{
    const Product = sequelize.define("Product",{
        productid : {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        name : DataTypes.STRING,
        descripcion : DataTypes.STRING,
        images : DataTypes.STRING,
        brands_brandid : DataTypes.INTEGER
    }, 
    {
        timestamps: false
    })

    /* Product.associate = (models =>{
        Product.belongsTo(models.Brand);
        
    }) */
    return Product;
    }