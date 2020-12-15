const axios = require ('axios');
const {url,timeout} = require('./defaults')
const {products} = require ('../database/models')

module.exports={
    getAll(){
        return axios({
            timeout:6000,
            method:'get',
            url: url + 'products'
        })
    },

    getPromo(){
        const productsBanner = products.findAll
        return axios({
            timeout:6000,
            method:'get',
            url: url + 'products'
        })
    },

    }
}