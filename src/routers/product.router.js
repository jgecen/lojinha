const express = require("express")
const router = express.Router()
const createProductController = require('../controller/product.controller')
const productController = createProductController()

router.get("/", productController.get)

module.exports = router