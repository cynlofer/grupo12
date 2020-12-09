const {sequelize,DataTypes}= require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const Deliverie = sequelize.define("Deliverie",{
        name : DataTypes.STRING
    }, 
    {
        timestamps: false
    })

    Deliverie.associate= models => {
        Deliverie.belongsToMany(models.Product,{
            through : "deliveries_products"
        })
    }
    return Deliverie;
    }