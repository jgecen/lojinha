const knex = require('./knex-test')
const createOrderDao = require('../../src/dao/order.dao')
const dataProducts = require('./data/products.data')
const dataCustomers = require('./data/customers.data')
const dataOrders = require('./data/orders.data')
const dataOrdersItems = require('./data/orders.items.data')

describe('Teste de order.dao - Listagem', () => {
    
    afterAll(async () => {
        await knex('order_itens').del()
        await knex('orders').del()
        await knex('customers').del()
        await knex('products').del()

    });

    beforeAll(async () => {
        await knex('customers').insert(dataCustomers);
        await knex('products').insert(dataProducts);
        await knex('orders').insert(dataOrders);
        await knex('order_itens').insert(dataOrdersItems);
    });

    test('Listagem de Orders', async () => {
        const dao = createOrderDao(knex)
        dao.getAll().then(data => {
            console.log(data)
            expect(data).not.toBeNull()
        })
        

    });

});