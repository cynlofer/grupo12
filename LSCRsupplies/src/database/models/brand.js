const {sequelize,DataTypes,Sequelize}= require("sequelize");
module.exports =(sequelize,DataTypes)=>{
    const Brand = sequelize.define("Brand",{
        brandid : {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
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