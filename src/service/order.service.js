
const createOrderService = (orderDao, orderItemDao) => {
    const _orderDao = orderDao
    const _orderItemDao = orderItemDao

    const _save = (order) => {
        return new Promise((resolve, reject) => {
            _orderDao.save(order)
                .then(dataOrder => {
                    const orderId = dataOrder[0].id
                    const promissesItems = []
                    for (let i = 0; i < order.items.length; i++) {
                        promissesItems.push(_orderItemDao.save(orderId, order.items[i]))
                    }
                    Promise.all(promissesItems)
                        .then(datas => {
                            resolve(datas)
                        })
                        .catch(errors => {
                            reject(errors)
                        });
                }).catch(err => {
                    reject(err)
                })
        })

    }

    const _updateStatus = (status) => {
        return orderDao.updateStatus(status)
    }

    return {
        save: _save,
        updateStatus: _updateStatus
    }
}

module.exports = createOrderService