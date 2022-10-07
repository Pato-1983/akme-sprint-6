
const fs = require('fs');
const path = require('path');


const productsJSON = fs.readFileSync(path.resolve(__dirname, '../database/products.json'), 'utf8');
const products = JSON.parse(productsJSON);

const jsonDB = require('../model/jsonDatabase.js');
const productModel = jsonDB('products');
const toThousand = n => n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");

controller = {

    index : (req,res) => {
        const products = productModel.readFile();
        const ofertas = products.filter(product => product.discount != 0);  
          
        res.render('main/index',{ofertas,toThousand});
    },

    contact: (req,res) => res.render('main/contact'),

    help: (req,res) => res.render('main/help'),

    about: (req,res) => res.render('main/about'),
    
}

module.exports = controller;