const bcrypt = require('bcryptjs');
const fs = require('fs');
const path = require('path');

const jsonDB = require('../model/jsonDatabase');
const usersModel = jsonDB ('users')
const users = jsonDB('users') 

const { validationResult } = require('express-validator')

const controller = {

    register: (req,res) => res.render('users/register'),

	users: (req,res) => {
        const users = usersModel.readFile();
        res.render('users/usersList', {users})
	},

	detail: (req,res) => { 
        const id = +req.params.id;
        let user = usersModel.find(id);    
        res.render('users/userDetail', {user})
    },
	
	edit: (req,res) => { 
        const id = +req.params.id;
        const users = usersModel.find(id);    
        res.render('users/userEdit', {users})
    },

    store: (req, res) => {
		
		const results = validationResult(req)
		
		if (results.errors.length > 0) {
			return res.render('users/register', {
				errors:results.mapped(),
				oldData:req.body
			})
		} else {

            let userToFind = usersModel.findByField("email", req.body.email)
			console.log(userToFind)

            if(userToFind){
                return res.render('users/register', {
                    errors:{
                        email:{
                            msg: 'Este email ya corresponde a un usuario registrado',
							
                        }
                    },
				oldData:req.body	
                })
            }}

		let newUser = {
			...req.body,
			password: bcrypt.hashSync(req.body.password, 10),
			image: req.file !== undefined ? req.file.filename : "default-user-image.png"
		}

		usersModel.create(newUser)
		res.redirect('/users/login')

	},

	update: (req, res) => {
		let id = Number(req.params.id);
		let userToEdit = usersModel.find(id);
		let images = [];
		let files = req.files
		
		files.forEach(image => {
			
			images.push(image.filename)
		});

		userToEdit = {
			id: userToEdit.id,
			...req.body,
			image: req.file !== undefined ? req.file.filename : "default-user-image.png"
			//image: files.length >= 1  ? images : userToEdit.image
		}

		usersModel.update(userToEdit)
		res.redirect("/users/users");
	},
    
    login: (req,res) => res.render('users/login'),

	loginProcess: (req,res) => {

		let userToLogin = usersModel.findByField ("email", req.body.email)
		if (userToLogin) {
			let passwordOk = bcrypt.compareSync (req.body.password, userToLogin.password)
			if (passwordOk) {
				delete userToLogin.password
				req.session.userLogged = userToLogin

				if(req.body.rememberMe) {
					res.cookie ('email', req.body.email, {maxAge: 1000 * 60 * 60 * 24})
				}

				return res.redirect ('/users/profile')
			}
		}
		return res.render ('users/login', {
			errors: {
				email: {
					msg: "Usuario o password incorrecto"
				}
			}
		})
	},

	profile: (req,res) => {
		console.log (req.cookies.email)
		res.render('users/userProfile', {
			user: req.session.userLogged})
	},

	logout: (req,res) => {
		res.clearCookie('email')
		req.session.destroy()
		console.log(req.session)
		return res.redirect ('/')

	},

	adminMenu: (req,res) => {
		res.render ('users/adminMenu')
	},

    cart: (req,res) => res.render('users/userCart'),
    
};

module.exports = controller;