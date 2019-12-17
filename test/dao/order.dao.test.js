const knex = require('./knex-test')
const createOrderDao = require('../../src/dao/order.dao')

describe('Teste de order.dao', () => {
    
    let id_customer = 0

    afterAll(async () => {
        await knex('orders').del()
        await knex('customers').del()

    });

    beforeAll(async () => {
        const data = await knex('customers').returning(['id']).insert({
            "name": "Gecen Dacome De Marchi",
            "cpf": "80857907000",
            "email": "dacome@email.com"
        });
        id_customer = data[0].id
    });

    test('testando a function save, sucesso', async () => {
        const dao = createOrderDao(knex)
        const data = await dao.save({
            "status": "CONCLUDED",
            "total": 189.80,
            "buyer": {
              "id": id_customer,
              "name": "Maria Aparecida de Souza",
              "cpf": "81258705044",
              "email": "mariasouza@email.com"
            }})

        expect(data).not.toBeNull()

    });

});