const express = require("express")
const { body, checkSchema } = require("express-validator")
const router = express.Router()
const knex = require("../dao/knex")

const orderDao = require('../dao/order.dao')(knex)
const orderItemDao = require('../dao/order.item.dao')(knex)
const orderService = require('../service/order.service')(orderDao, orderItemDao)

const orderController = require('../controller/order.controller')(orderService)

const validatorNumber = {
    notEmpty: true,
    custom: {
        options: (value) => { return value > 0 },
        errorMessage: 'Campo tem que ser maior que 0'
    }
}
//router.get("/", orderController.get)

router.put("/",
    checkSchema({
        status: {
            notEmpty: true,
            errorMessage: 'Campo obrigatório'
        },
        order_id: {
            notEmpty: true,
            errorMessage: 'Campo obrigatório'
        }

    }),

    orderController.put)

router.post("/",
    checkSchema({
        status: {
            notEmpty: true,
            errorMessage: 'Campo obrigatório'
        },
        total: validatorNumber,

        'buyer.id': {
            notEmpty: true
        },
        items: {
            notEmpty: true
        },
        'items.*.amount': validatorNumber,
        'items.*.price_unit': validatorNumber,
        'items.*.total': validatorNumber,
        'items.*.product.id': {
            notEmpty: true
        }
    })
    , orderController.post)

module.exports = router