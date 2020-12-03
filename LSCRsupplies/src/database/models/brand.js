const {sequelize,DataTypes}= require("sequelize");

module.exports= (sequelize,DataTypes)=>{
    const Brand = sequelize.define("Brand",{
        name : DataTypes.STRING
    }, 
    {
        timestamps: false
    })

    /* Brand.associate = (models =>{
    Brand.hasMany(models.Product);
    }) */
    return Brand;
    }