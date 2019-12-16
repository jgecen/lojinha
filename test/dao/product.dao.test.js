const knex = require('./knex-test')
const createProductDao = require('../../src/dao/product.dao')

describe('Teste de product.dao', () => {

    afterAll(async () => {
        await knex('products').del()
    });

    beforeAll(async () => {
        await knex('products').insert({
            "sku": 999,
            "name": "XXx",
            "price": 109.90
        });
    });

    test('testando a function save, sucesso', async () => {
        const dao = createProductDao(knex)
        const data = await dao.save({
            "sku": 8552515751438644,
            "name": "Casaco Jaqueta Outletdri Inverno Jacquard",
            "price": 109.90
        })

        expect(data).not.toBeNull()

    });
    test('testando a function save, erro constrainst', () => {
        const dao = createProductDao(knex)
        dao.save({
            "sku": 999,
            "name": "XXx",
            "price": 109.90
        }).then((data) => {
            expect(data).toBeNull()
        }).catch((err) => {
            expect(err).not.toBeNull()
        })
    });
    test('testando a function getAll', () => {
        const dao = createProductDao(knex)
        dao.getAll().then((data) => {
            expect(data).not.toBeNull()
        }).catch((err) => {
            expect(err).toBeNull()
        })
    });

});