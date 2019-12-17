const knex = require('./knex-test')
const createItemOrderDao = require('../../src/dao/order.item.dao')

describe('Teste de order.item.dao', () => {

    let id_customer = 0
    let id_order = 0
    let id_product = 0

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

        const orderData = await knex('orders').returning(['id'])
            .insert({
                customer_id: id_customer,
                total: 189.80,
                status: "CONCLUDED"
            });
        id_order = orderData[0].id

        const productData = await knex('products').returning(['id'])
            .insert({
                sku: 8552515751438644,
                name: "Casaco Jaqueta",
                price: 109.90
            });
        id_product = productData[0].id
    });

    test('testando a function save, sucesso', async () => {
        const dao = createItemOrderDao(knex)

        const data = await dao.save(id_order, {
            amount: 1,
            price_unit: 109.90,
            total: 109.90,
            product: {
                id: id_product,
                sku: 8552515751438644,
                title: "Casaco Jaqueta"
            }
        })

        expect(data).not.toBeNull()

    });

});