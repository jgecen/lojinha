
const createProductDao = (knex) => {
    const _knex = knex
    const _save = (product) => {
        return _knex('products').returning(['id', 'sku']).insert(product);
    }

    return {
        save: _save
    }
}

module.exports = createProductDao