const {sequelize,DataTypes}= require("sequelize");
var moment = require('moment');

module.exports =(sequelize, DataTypes)=>{
    const User = sequelize.define("User",{
        first_name: DataTypes.STRING,
        last_name: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.STRING,
        image : DataTypes.STRING
    },  
    {
        timestamps: false
    })

    return User;
    }