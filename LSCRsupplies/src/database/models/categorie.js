const {sequelize,DataTypes} = require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const Categorie = sequelize.define("Categorie",{
        name : DataTypes.STRING
    }, 
    {
        timestamps: false
    })
    Categorie.associate= models => {
        Categorie.belongsToMany(models.Product,{
            through : "categories_products"
        })
    }
    return Categorie;
    }