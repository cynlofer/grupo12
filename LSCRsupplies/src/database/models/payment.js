const {sequelize,DataTypes}= require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const Payment = sequelize.define("Payment",{
        name : DataTypes.STRING
    }, 
    {
        timestamps: false
    })

    Payment.associate= models => {
        Payment.belongsToMany(models.Product,{
            through : "payments_products"
        })
    }
    return Payment;
    }