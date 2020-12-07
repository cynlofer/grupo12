const {sequelize,DataTypes} = require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const Color = sequelize.define("Color",{
        name : DataTypes.STRING
    }, 
    {
        timestamps: false
    })
    Color.associate= models => {
        Color.belongsToMany(models.Product,{
            through : "color_products"
        })
    }
    return Color;
    }