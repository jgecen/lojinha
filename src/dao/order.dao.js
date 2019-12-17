
const createOrderDao = (knex) => {
    const _knex = knex
    const _save = (order) => {
        return _knex('orders').returning(['id'])
            .insert({ customer_id: order.buyer.id, total: order.total, status: order.status });
    }

    const _getAll = () => {
        return _knex.select().table('orders')

    }
    return {
        save: _save,
        getAll: _getAll
    }
}

module.exports = createOrderDao