const express = require('express');
const usersController = require('../controllers/usersController');
const router = express.Router();
const multerMiddleware = require('../middleware/multer');
const uploadFile = multerMiddleware('images','user');
const { body } = require ('express-validator')
const path = require('path');
const { error } = require('console');
const validations = require('../middleware/userRegisterValidation');
const guestMiddleware = require('../middleware/guestMiddleware')
const authMiddleware = require('../middleware/authMiddleware')
const adminMiddleware = require('../middleware/adminMiddleware');

router.get('/register', guestMiddleware, usersController.register);
router.get('/users', adminMiddleware, usersController.users)
router.get('/detail/:id', adminMiddleware, usersController.detail)
router.get('/adminMenu', adminMiddleware, usersController.adminMenu)
router.get('/profile', authMiddleware, usersController.profile)
router.get('/edit/:id', adminMiddleware, usersController.edit)
router.put('/edit/:id', adminMiddleware, uploadFile.single('image'), usersController.update)
router.post('/register', uploadFile.single('image'), validations, usersController.store);
router.get('/login', guestMiddleware, usersController.login);
router.post('/login', usersController.loginProcess);
router.get('/logout', usersController.logout);
router.get('/userCart', usersController.cart);


module.exports = router;

