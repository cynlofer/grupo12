// **** requires **** //
const express = require('express');
const router = express.Router();
const multer = require('multer');
const fs = require("fs");
var {path} = require('../app');
const path1 = require ("path");
var {body, validationResult, check} = require ('express-validator');
const usuariosFilePath = path1.join(__dirname, '../data/usuarios.json');

const leerJSON= function(){
  return JSON.parse(fs.readFileSync(usuariosFilePath, "utf-8"));
};

const usersController = {
/* GET users listing. */
index: ('/', function(req, res, next) {
    res.send('respond with a resource');
  }),

  /* GET register. */
register: (req, res, next) => {
    res.render('register')
    },
  
 login: (req, res, next) => {
    res.render('userlogin');
      },
  
processLogin: (req, res, next) => {
  console.log("en login");
  let usuarios = leerJSON();
  let usuarioEncontrado = usuarios.find(usuario => usuario.email == req.body.email );
  if (usuarioEncontrado != undefined){
    let emailUsuarioEncontrado = usuarioEncontrado.email;
    req.session.email = emailUsuarioEncontrado;
    req.session.email = emailUsuarioEncontrado;
    if(req.body.rememberMe != undefined){
      res.cookie("recordarme", usuarioEncontrado.email, {maxAge : 1000*60*60});
    }
  };
  
  //console.log(req.session.email);
  
  res.redirect("/");
},

edit: (req, res, next) => {
    res.render ('useredit');
},

/* POST user edit. */
edit: (req, res, next) => {
    res.redirect ('useredit');
}
}
  module.exports = usersController;
  