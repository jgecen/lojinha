const express = require("express")
const { check } = require("express-validator")
const router = express.Router()
const knex = require("../dao/knex")

const orderDao = require('../dao/order.dao')(knex)
const orderItemDao = require('../dao/order.item.dao')(knex)
const orderService = require('../service/order.service')(orderDao, orderItemDao)

const orderController = require('../controller/order.controller')(orderService)

router.get("/", orderController.get)
router.post("/", orderController.post)

module.exports = router