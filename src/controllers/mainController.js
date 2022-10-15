
const fs = require('fs');
const path = require('path');
const db = require('../database/models')


const productsJSON = fs.readFileSync(path.resolve(__dirname, '../database/products.json'), 'utf8');
const products = JSON.parse(productsJSON);

const jsonDB = require('../model/jsonDatabase.js');
const productModel = jsonDB('products');
const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

controller = {

    index : async (req,res) => {
        try {

        const products = await db.Products.findAll({include: [db.Images]});  
          
        res.render('main/index',{products,toThousand});
    
        } catch (error) {
            res.status(500).json({ error: error.message });
    }
    
    },

    contact: (req,res) => res.render('main/contact'),

    help: (req,res) => res.render('main/help'),

    about: (req,res) => res.render('main/about'),
    
}

module.exports = controller;