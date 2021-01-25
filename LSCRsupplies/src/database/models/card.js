const {sequelize, DataTypes} = require("sequelize");
var moment = require('moment');
module.exports = (sequelize, DataTypes)=>{
    const Card = sequelize.define("Card",{
        productid : DataTypes.INTEGER,
        nombre : DataTypes.STRING,
        precio : DataTypes.INTEGER,
        imagen : DataTypes.STRING,
        iduser: DataTypes.INTEGER,
        cantidad : DataTypes.INTEGER,
        fecha : DataTypes.DATEONLY,
        idpedido : DataTypes.INTEGER,
        estado : DataTypes.INTEGER,
    })
    return Card;
}