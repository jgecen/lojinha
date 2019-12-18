const express = require("express")
const { body, checkSchema } = require("express-validator")
const router = express.Router()
const knex = require("../dao/knex")

const orderDao = require('../dao/order.dao')(knex)
const orderItemDao = require('../dao/order.item.dao')(knex)
const orderService = require('../service/order.service')(orderDao, orderItemDao)

const orderController = require('../controller/order.controller')(orderService)

router.get("/", orderController.get)
router.post("/",
    checkSchema({
        status: {
            notEmpty: true,
            errorMessage: 'Campo obrigatório'
        },
        total: {
            notEmpty: true
        },
        'buyer.id': {
            notEmpty: true
        },
        items: {
            notEmpty: true
        },
        'items.*.amount': {
            notEmpty: true
        },
        'items.*.price_unit': {
            notEmpty: true
        },
        'items.*.total': {
            notEmpty: true
        },
        'items.*.product.id': {
            notEmpty: true
        }
    })
    , orderController.post)

module.exports = router