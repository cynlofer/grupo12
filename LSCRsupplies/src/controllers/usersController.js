// **** requires **** //
const express = require('express');
const router = express.Router();
const multer = require('multer');
//const fs = require("fs");
const bcrypt = require('bcryptjs');
var {path} = require('../app');
const path1 = require ("path");
var {body, validationResult, check, cookie} = require ('express-validator');
//Sequelize 
const {Product, User, Brand,Card}= require("../database/models");
const {Op} = require('sequelize');
const admin=["ginoca30@gmail.com","lorisepu@hotmail.com","cynlofer@gmail.com","perezsandy775@gmail.com"];
//console.log(admin);
const usersController = {
      /* GET register. */
      register: (req, res, next) => {
      res.render('register',{itemCarrito : req.session.itemCarrito})
      },

      /* POST register */
      saveUser: async (req, res, next) => {
        // Does the email already exists in the DB? 
        try {
          let newUser = req.body;
          console.log(newUser);
          let newUserEmail = req.body.email;
          let checkExistingEmail = await User.findAll(
            {where: 
              {email: newUser.email}
            })
          if (checkExistingEmail == "") {
            const resultado = validationResult(req);
            if(resultado.isEmpty()){
              const nuevoUser = await User.create(newUser);
              await nuevoUser.update(
                { image: req.file.filename,
                  password: bcrypt.hashSync(req.body.password, 10)
                 }, //what going to be updated
                { where: { id: (nuevoUser.id) }});
              res.redirect('/');

            } else {
              res.render("register", {allData: newUser, errorMsg: "La extension de la imagen no es admitida",itemCarrito : req.session.itemCarrito});
            }
          } else {
            res.render("register", {allData: newUser, errorMsg: "El email ya se encuentra registrado",itemCarrito : req.session.itemCarrito});
          }
          } catch (error) {
            console.log(error)
        }
      },
      
      /* GET login*/
      login:async (req, res, next) => {
        try{
           if(req.session.email){
           let usuarioLogeado = await User.findAll(
           {where: 
             {email: req.session.email}
            });
             res.render("userEdit",{userToEdit:usuarioLogeado[0],itemCarrito : req.session.itemCarrito});
            }else{
                res.render('userlogin',{itemCarrito : req.session.itemCarrito});
             }
        }catch(error){
             console.log(error);
        }
      },
      /* GET user edit */  
      edit: async (req, res,next) => {
        try {
        let useredit= req.params.id;
        const userToEdit = await User.findByPk(useredit);
        res.render ("userEdit",{userToEdit:userToEdit,itemCarrito : req.session.itemCarrito});
        }catch(error){
          console.log(error);
        }
      
      },

      /* POST user edit*/
      actualizar: async (req, res, next) => {
        try {
          const userID = req.params.id;
          const saveChanges = await User.findByPk(userID);
          await saveChanges.update({
            id : userID,
            first_name: req.body.first_name,
            last_name: req.body.last_name,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, 10)
           })
          res.redirect("/"); 

        } catch(error){
          console.log(error);
        }
      },
      processLogin: async (req, res) => {
        try{ 
          let newUser = req.body.email;
          usuarioPass = req.body.password;
          let checkExistingEmail = await User.findAll(
            {where: 
              {email: newUser}
            });
          if (checkExistingEmail[0] != undefined){
            const chek = bcrypt.compareSync(usuarioPass, checkExistingEmail[0].password)
            if(chek){
              let emailUsuarioEncontrado = checkExistingEmail[0].email;
              req.session.email = emailUsuarioEncontrado;
              req.session.iduser = checkExistingEmail[0].id;
              req.session.itemCarrito = 0;
              req.session.carritoActivo = 0;
              req.session.idPedido =0;
              /* busqueda en carrito, si existe en estado 0 (activo) */
              const itemCarrito = await Card.count({
                where : {iduser : checkExistingEmail[0].id,
                       estado : 0},
                       distinct : "id"        //este atributo permite usar el metodo count en ID
                
              });
              console.log("encontro carrito con estos items:"+itemCarrito);
              if(itemCarrito != 0){
                console.log("entre a if itemca carrito postlogin");
                req.session.itemCarrito = itemCarrito;
                //req.session.carritoActivo = 5;
                //req.session.idPedido = itemCarrito[0].idpedido;
                console.log("req.session deprocess login items"+req.session.itemCarrito);
                /* fin busqueda carrito */

              }
              if(admin.includes(emailUsuarioEncontrado)){
                req.session.admin= true;
              }
            }else{
              res.render("userlogin", {allData: newUser, errorMsg: " La contraseña es incorrecta",itemCarrito : req.session.itemCarrito});
            }
            
            if(req.body.rememberMe != undefined){
              res.cookie("recordarme", checkExistingEmail.email, {maxAge : 1000*60*60*60*24});
            }
          }else{
            res.render("userlogin", {allData: newUser, errorMsg: " Email no existe (Registrese)",itemCarrito : req.session.itemCarrito});
          }
        }
        catch(error){
          console.log(error);
        }
        res.redirect("/");
      },

      logout: (req,res,next)=>{
        req.session.destroy();
        res.redirect("/")
      },

      /* GET preguntasFrecuentes */
      view: (req,res,next)=>{
      res.render('partials/preguntasFrecuentes',{itemCarrito : req.session.itemCarrito})
  
     },

     /* GET quienesSomos */
     who: (req,res,next)=>{
      res.render('partials/quienesSomos',{itemCarrito : req.session.itemCarrito})
  
     },

    };


module.exports = usersController;