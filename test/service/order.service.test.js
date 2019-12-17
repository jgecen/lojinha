const knex = require('../dao/knex-test')
const createItemOrderDao = require('../../src/dao/order.item.dao')
const createOrderDao = require("../../src/dao/order.dao")
const createOrderService = require("../../src/service/order.service")

describe('Teste de service.oreder', () => {

    let id_customer = 0
    let id_product = 0
    let id_product2 = 0

    afterAll(async () => {
        await knex('order_itens').del()
        await knex('orders').del()
        await knex('customers').del()
        await knex('products').del()

    });

    beforeAll(async () => {

        const customerData = await knex('customers').returning(['id'])
            .insert({
                name: "Gecen Dacome De Marchi",
                cpf: "80857907000",
                email: "dacome@email.com"
            });
        id_customer = customerData[0].id

        const productData = await knex('products').returning(['id'])
            .insert({
                sku: 8552515751438644,
                name: "Casaco Jaqueta",
                price: 109.90
            });
        id_product = productData[0].id
        const productData2 = await knex('products').returning(['id'])
            .insert({
                sku: 8552515751438645,
                name: "Camiseta Colcci",
                price: 79.90
            });
        id_product2 = productData2[0].id
    });

    test('testando a function save, sucesso', async () => {
        const itemDao = createItemOrderDao(knex)
        const orderDao = createOrderDao(knex)
        const service = createOrderService(orderDao, itemDao)

        const data = await service.save({
            "status": "CONCLUDED",
            "total": 189.80,
            "buyer": {
                "id": id_customer,
                "name": "Gecen Dacome De Marchi",
                "cpf": "80857907000",
                "email": "dacome@email.com"
            },
            "items": [
                {
                    "amount": 1,
                    "price_unit": 109.90,
                    "total": 109.90,
                    "product": {
                        "id": id_product,
                        "sku": 8552515751438644,
                        "title": "Casaco Jaqueta"
                    }
                },
                {
                    "amount": 1,
                    "price_unit": 79.90,
                    "total": 79.90,
                    "product": {
                        "id": id_product2,
                        "sku": 8552515751438645,
                        "title": "Camiseta Colcci"
                    }
                }
            ]
        })

        expect(data).not.toBeNull()

    });

});