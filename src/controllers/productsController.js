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

        try {
            
           // const imagenes = await db.Images.findAll()
            const productos = await db.Products.findAll ({include: [db.Images]});

            productos.forEach(producto => {

            console.log(producto.Images[0].name)


            })

            return res.render('products/products', {productos, toThousand})
        } 
		catch (error) {
            res.json(error.message)
        }


		
    },

    detail: async (req,res) => {
        try{

            const id = +req.params.id;
            const product = await db.Products.findByPk(id, {include: [db.Images]});

            res.render('products/productDetail', {product,toThousand})
        
        }catch (error) {
            res.json(error.message)
        }
    },

    create : async (req,res) => {
        try {
            const categories = await db.Category.findAll();
            const colors = await db.Color.findAll();
            res.render('products/productCreate', {categories, colors})
        } catch (error) {
            res.json({error: error.message});
        }
    },

    store: async (req, res) => {

		let files = req.files

		const results = validationResult(req)

		
		if (results.errors.length > 0) {
        
            try{
                const categories = await db.Category.findAll()
                const colors = await db.Color.findAll()

			    return res.render('products/productCreate', {
				    errors:results.mapped(),
				    oldData:req.body, categories, colors})
		
            } catch (error) {
            res.status(500).json({ error: error.message });
        }}
	
		let {name, description, price, categoryId, colorId} = req.body

		let objAux={
            name: name,
            description: description,
            price: price,
            category_id: categoryId,
			color_id: colorId
        }

		try {

			let productImages = []

            let newProduct = await db.Products.create(objAux);



            for(let i = 0 ; i<req.files.length;i++) {
                productImages.push({
                    name: req.files[i].filename,
                    productId: newProduct.id
                })
            }
                if (productImages.length > 0) {
                    await db.Images.bulkCreate(productImages)
                }

            
        } catch (error) {
            res.status(500).json({ error: error.message });
        }

		return res.redirect('/products/create')
    },

    edit: async (req,res) => {
        try {

            const id = +req.params.id;
            const product = await db.Products.findByPk(id);    
            
            let categories = await db.Category.findAll();
            let colors = await db.Color.findAll();

            res.render('products/productEdit',{product, categories, colors});
        
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },


    delete: async (req,res) =>{
        try {

            let id = req.params.id;
            await db.Products.destroy ({where: {id:id}});
            await db.Images.destroy ({where: {productId:id}});
            res.redirect("/");
        
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

	update: async (req, res) => {

        try {
        
            let id = req.params.id
            let {name, description, price, categoryId, colorId} = req.body
            let newImages = []

            let objAux = {
                name: name,
                description: description,
                price: price,
                category_id: categoryId,
                color_id: colorId
            }

        
            await db.Products.update(objAux, {where:{id:id}})

            //
            if (req.files.length > 0) {
                for(let i = 0 ; i<req.files.length;i++) {
                    newImages.push({
                        name: req.files[i].filename,
                        productId: id
                    })
            }
                
            
                const oldImages = await db.Images.findAll({where: {productId: id}})
                oldImages.forEach( image => {
                    fs.unlinkSync(path.resolve(__dirname, '../../public/images/'+image.name))
                })
                
                await db.Images.destroy({where: {productId: id}})
                await db.Images.bulkCreate(newImages)
            } 




            console.log (req.files)
            console.log (req.file)
            
            //

            res.redirect("/")

        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

}


module.exports = controller;