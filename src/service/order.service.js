
const createOrderService = (orderDao, orderItemDao) => {
    const _orderDao = orderDao
    const _orderItemDao = orderItemDao

    const _save = async (order) => {
        try {

          
            const dataOrder = await _orderDao.save(order)
            const orderId = dataOrder[0].id
            order.items.forEach(async element => {
                await _orderItemDao.save(orderId, element)
            });
            /*
            for (let i = 0; i < order.items.length; i++) {
                                
            }
            */
        } catch (error) {
            throw new Error( `Erro ao salvar order ${error}` )
        }
    }


    return {
        save: _save
    }
}

module.exports = createOrderService