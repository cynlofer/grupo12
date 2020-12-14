const {sequelize,DataTypes}= require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const salesDetail = sequelize.define("salesDetail",{
        promo_code: DataTypes.INTEGER,
        products_productid: DataTypes.INTEGER,
        price_priceid: DataTypes.INTEGER,
        deliveries_deliveryid: DataTypes.INTEGER,
        users_userid: DataTypes.INTEGER,
        payments_paymentid: DataTypes.INTEGER,
        sale_types_saleid: DataTypes.INTEGER,
    }, 
    {
        timestamps: false
    })

    return salesDetail;
    }