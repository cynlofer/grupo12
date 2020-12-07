// **** requires **** //
const express = require('express');
const router = express.Router();
const multer = require('multer');
const fs = require("fs");
const bcrypt = require('bcryptjs');
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
      /* GET register. */
      register: (req, res, next) => {
      res.render('register')
      },

      /* POST register */
      saveUser: async (req, res, next) => {
        // Does the email already exists in the DB? 
        try {
          let newUser = req.body;
          let newUserEmail = req.body.email;
          let checkExistingEmail = await User.findAll(
            {where: 
              {email: newUser.email}
            })
          if (checkExistingEmail == "") {
            await User.create(newUser);
            res.redirect('/');
          } else {
            res.render("register", {allData: newUser, errorMsg: "El email ya se encuentra registrado"});
          }
          } catch (error) {
            console.log(error)
        }
      },
      
      /* GET login*/
      login: (req, res, next) => {
      res.render('userlogin');
      },
  
      /* GET user edit */  
      edit: async (req, res,next) => {
        try {
        // console.log(req.params.id);
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
         password: bcrypt.hashSync(req.body.password, 8)
        }) 

        } catch(error){
          console.log(error);
        }
      },
    };


module.exports = usersController;