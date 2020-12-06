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

//Sequelize 
const {Product, Brand, User}= require("../database/models");
const {Op} = require('sequelize');

const usersController = {
      /* GET users listing. */
      index: (req, res, next) => {
      res.send('respond with a resource');
      },

      /* GET register. */
      register: (req, res, next) => {
      res.render('register')
      },

      /* POST register */
      saveUser: async (req, res, next) => {
      try {
            console.log(req.body);
            const newUser = await User.create(req.body)
            res.redirect('/');
                        
          }catch(error){
            console.log(error);
          }
      },
      
      /* GET login revisar*/
      login: (req, res, next) => {
      res.render('userlogin');
      },
  
      /* GET user edit revisar */  
      edit: async (req, res,next) => {
        try {
        console.log(req.params.id);
        const userToEdit = await User.findByPK(req.params.id)
        res.render ("user/userEdit",{userToEdit:userToEdit});
                      
        }catch(error){
          console.log(error);
        }
      
      },

      /* POST user edit*/

  
      actualizar: async (req, res, next) => {
        try {
          const userID = req.params.id;
          const saveChanges = await User.findByPK(userID);

         await saveChanges.update({
         first_name: req.body.first_name,
         last_name: req.body.last_name,
         email: req.body.email,
         password: req.body.password
        }) 

        } catch(error){
          console.log(error);
        }
      },




      /* POST login */
      // processLogin: async (req, res, next) => {
      // try {
      //       console.log(req.body);
      //       const loginUser = await User.findAll({
      //         where: {
      //           email: {[Op.eq]: 'email'},
      //           password: {[Op.eq]: 'password'}
      //         }
      //       })
      //       res.send(loginUser);
                      
      //     }catch(error){
      //     console.log(error);
      //   }

        // let usuarios = leerJSON();

        // let usuarioEncontrado = usuarios.find(usuario => usuario.email == req.body.email);

        // if (usuarioEncontrado != undefined){
        //   let emailUsuarioEncontrado = usuarioEncontrado.email;
        //   req.session.email = emailUsuarioEncontrado;
        //   req.session.email = emailUsuarioEncontrado;
        //   if(req.body.rememberMe != undefined){
            
        //     res.cookie("recordarme", usuarioEncontrado.email, {maxAge : 1000*60*60});
      
        //   }
        // }
      // },

     
    };


module.exports = usersController;