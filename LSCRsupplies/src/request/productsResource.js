const axios = require ('axios');
const {url,timeout} = require('./defaults')
const {Products, Brand} = require ('../database/models')

module.exports={
    getAll(table){
        return axios({
            timeout,
            method:'GET',
            url: url + table
        })
    },
}