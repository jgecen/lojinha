const express = require("express")
const { check } = require("express-validator")
const router = express.Router()
const knex = require("../dao/knex")
const productDao = require('../dao/product.dao')(knex)
const productController = require('../controller/product.controller')(productDao)

router.get("/", productController.get)
router.post("/",
    [
        check("price").custom(price => {
            if (price <= 0) {
                return Promise.reject("O atributo price deve ser maior que zero.")
            }
        })
    ]
    , productController.post)

module.exports = router