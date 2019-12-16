
const createCustumerDao = (knex) => {
    const _knex = knex
    const _save = (product) => {
        return _knex('customers').returning(['id', 'cpf']).insert(product);
    }

    const _getAll = () => {
        return _knex.select().table('customers')

    }
    return {
        save: _save,
        getAll: _getAll
    }
}

module.exports = createCustumerDao