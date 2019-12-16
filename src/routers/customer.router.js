const express = require("express")
const { check } = require("express-validator")
const { validate } = require('cpf-check');
const router = express.Router()
const knex = require("../dao/knex")
const custometDao = require('../dao/customer.dao')(knex)
const customerController = require('../controller/customer.controller')(custometDao)

router.get("/", customerController.get)
router.post("/",
    [
        check("cpf").custom(cpf => {
            if (!validate(cpf)) {
                return Promise.reject("O campo cpf é invalido.")
            }
        })
    ]
    , customerController.post)

module.exports = router