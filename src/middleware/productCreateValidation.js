const { body } = require ('express-validator')
const path = require('path');
const { error } = require('console');


const validations =[
    body('name').notEmpty() .withMessage('Ingresa un nombre para el producto'),
    
    body('description').notEmpty() .withMessage('Ingresa una descripción'),
    
    body('price')
        .notEmpty() .withMessage('Ingresa el precio').bail() 
        .isNumeric() .withMessage('Ingresa un importe válido'),

    body('image').custom((value, {req}) => {
        const files = req.files

        
            
        if (!files) {
            throw new Error('Inserta una imagen de perfil');
        }else {
            const acceptedExtensions = ['.jpg', '.JPG', '.png', '.PNG', '.jpeg', '.JPEG', '.pneg', '.PNEG'];
    
            files.forEach(file => {
                let fileExtension = (path.extname(file.filename))
            if(!acceptedExtensions.includes(fileExtension)){
                throw new Error(`Los formatos de imagen válidos son ${acceptedExtensions.join(', ')}`);
            }
        })
                
                
        }
        return true;
    }),
    
    body('categoryId').notEmpty() .withMessage('Ingresa una categoría'),
    
    body('colorId')
        .notEmpty() .withMessage('Ingresa un color'),

    body('discount')
        .isNumeric() .withMessage('Ingresa un valor correcto')
    
]

module.exports = validations;