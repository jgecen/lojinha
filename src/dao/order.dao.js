
const createOrderDao = (knex) => {
    const _knex = knex
    const _save = (order) => {
        return _knex('orders').returning(['id'])
            .insert({ customer_id: order.buyer.id, total: order.total, status: order.status });
    }

    const _getAll = () => {
        return _knex.select().table('orders')

    }
    const _updateStatus = (status) => {
        return _knex('orders').where({id: status.order_id}).update({status: status.status})
    }
    return {
        save: _save,
        updateStatus: _updateStatus,
        getAll: _getAll
    }
}

module.exports = createOrderDao