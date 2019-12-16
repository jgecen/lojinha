
const createProductDao = (knex) => {
    const _knex = knex
    const _save = (product) => {
        return _knex('products').returning(['id', 'sku']).insert(product);
    }

    const _getAll = () => {
        return _knex.select().table('products')

    }
    return {
        save: _save,
        getAll: _getAll
    }
}

module.exports = createProductDao