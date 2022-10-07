const fs = require('fs');
const path = require('path');

const jsonDB = require('../model/jsonDatabase');
const productModel = jsonDB ('products')
const products = jsonDB('products') 
const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

const { validationResult } = require('express-validator')


const db  = require("../database/models");
const { Op } = require("sequelize");

const moment = require("moment");

const formatDate = (fecha) => {
    return moment(fecha).format('YYYY-MM-DD');
}


const controller = {

    products: async (req, res) => {

		const  include = ['Images']

        try {
            const productos = await db.Products.findAll ({include});
			console.log(productos)
            return res.render('products/products', {productos, toThousand})
        } 
		catch (error) {
            res.json(error.message)
        }
		
    },

    detail: (req,res) => { 
        const id = +req.params.id;
        const product = productModel.find(id);    
        res.render('products/productDetail', {product,toThousand})
    },

    create: (req,res) => res.render('products/productCreate'),

    store: async (req, res) => {

		let files = req.files

		const results = validationResult(req)
		
		if (results.errors.length > 0) {
			//console.log (results.errors)
			return res.render('products/productCreate', {
				errors:results.mapped(),
				oldData:req.body
			})
		}
	
		let {name, description, price, category, color} = req.body

		let objAux={
            name: name,
            description: description,
            price: price,
            category_Id: category,
			color_Id: color
        }

		try {

			let productImages = []

            let newProduct = await db.Products.create(objAux);

			console.log (newProduct)

			files.forEach(image => {
                productImages.push({name: image.filename, productId: newProduct.id})
            })
            
            let images = await db.Images.bulkCreate(productImages);

            
        } catch (error) {
            res.status(500).json({ error: error.message });
        }

		return res.redirect('/products/create')
    },

    edit: (req,res) => { 
        const id = +req.params.id;
        const product = productModel.find(id);    
        res.render('products/productEdit',{product});
    },

    delete: function(req,res){
        let id = Number(req.params.id);
        products.delete(id);
        res.redirect("/");
    },

	update: (req, res) => {
		let id = Number(req.params.id);
		let productToEdit = productModel.find(id);
		let images = [];
		let files = req.files
		
		files.forEach(image => {
			
			images.push(image.filename)
		});

		productToEdit = {
			id: productToEdit.id,
			...req.body,
			image: files.length >= 1  ? images : productToEdit.image
		}

		productModel.update(productToEdit)
		res.redirect("/");
	},
	
    
    filter: (req,res) => {
        let filtro = req.query;
        const products = productModel.readFile();
        res.render('products/products', {products,toThousand,filtro})
    },

}


module.exports = controller;