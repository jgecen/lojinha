
const createOrderItemDao = (knex) => {
    const _knex = knex


    const _save = (orderId, orderItem) => {

        return _knex('order_itens').returning(['id'])
            .insert({
                order_id: orderId,
                product_id: orderItem.product.id,
                amount: orderItem.amount,
                price_unit: orderItem.amount,
                total: orderItem.total
            });
    }

    const _itensByOrderId = (orderId) => {
        return _knex('order_itens').where("order_id", orderId)

    }
    return {
        save: _save,
        itensByOrderId: _itensByOrderId
    }
}

module.exports = createOrderItemDao