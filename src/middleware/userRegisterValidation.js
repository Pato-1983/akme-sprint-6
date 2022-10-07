const { body } = require ('express-validator')
const path = require('path');
const { error } = require('console');


const validations =[
    body('firstName').notEmpty() .withMessage('Ingresa un nombre'),
    body('lastName').notEmpty() .withMessage('Ingresa un apellido'),
    
    body('email')
        .notEmpty() .withMessage('Ingresa un email').bail() 
        .isEmail() .withMessage('Ingresa un email válido'),
    
        body('password').notEmpty() .withMessage('Ingresa una contraseña'),
    
    body('celular')
        .notEmpty() .withMessage('Ingresa un telefono').bail() 
        .isNumeric() .withMessage('Ingresa un telefono válido. Ej: 5491100000000'),

    body('image').custom((value, {req}) => {
        const file = req.file
        
        if (!file) {
            throw new Error('Inserta una imagen de perfil');
        }else {
            const acceptedExtensions = ['.jpg', '.JPG', '.png', '.PNG', '.jpeg', '.JPEG', '.pneg', '.PNEG'];
            console.log (file)
            console.log (file.filename)

                if(!acceptedExtensions.includes (path.extname (file.filename))){
                    throw new Error('Las extenciones validas son: ' + acceptedExtensions.join(', '));
                };
            
        }
        return true;
    })
]

module.exports = validations;
