const {sequelize,DataTypes} = require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const Color = sequelize.define("Color",{
        name : DataTypes.STRING
    }, 
    {
        timestamps: false
    })

    return Color;
    }