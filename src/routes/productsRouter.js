const express = require('express');
const router = express.Router();
const productsController = require('../controllers/productsController');
const multerMiddleware = require('../middleware/multer');
const uploadFile = multerMiddleware('images','product');
const adminMiddleware = require('../middleware/adminMiddleware');
const validation = require('../middleware/productCreateValidation');

router.get('/detail/:id', productsController.detail)
router.get('/edit/:id', adminMiddleware, productsController.edit)
router.put('/edit/:id', uploadFile.array('image'), productsController.update)
router.get('/create', adminMiddleware, productsController.create)
router.post('/create',uploadFile.array('image'), validation, productsController.store);
router.get('/products', productsController.products)
router.delete('/delete/:id', adminMiddleware, productsController.delete);
module.exports = router;
