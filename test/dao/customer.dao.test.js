const knex = require('./knex-test')
const createCustomerDao = require('../../src/dao/customer.dao')

describe('Teste de customer.dao', () => {

    afterAll(async () => {
        await knex('customers').del()
    });

    beforeAll(async () => {
        await knex('customers').insert({
            "name": "NAME",
            "cpf": "00000000000",
            "email": "maria@email.com"
         });
    });

    test('testando a function save, sucesso', async () => {
        const dao = createCustomerDao(knex)
        const data = await dao.save({
            "name": "Maria Aparecida de Souza",
            "cpf": "81258705044",
            "email": "mariasouza@email.com"
         })

        expect(data).not.toBeNull()

    });
    test('testando a function save, erro constrainst', () => {
        const dao = createCustomerDao(knex)
        dao.save({
            "name": "NAME",
            "cpf": "00000000000",
            "email": "maria@email.com"
         }).then((data) => {
            expect(data).toBeNull()
        }).catch((err) => {
            expect(err).not.toBeNull()
        })
    });
    test('testando a function getAll', () => {
        const dao = createCustomerDao(knex)
        dao.getAll().then((data) => {
            expect(data).not.toBeNull()
        }).catch((err) => {
            expect(err).toBeNull()
        })
    });

});