const express = require('express')

const bodyParser = require('body-parser')

const productRouter = require('./routers/product.router')

const customerRouter = require('./routers/customer.router')

const orderRouter = require('./routers/order.router')

const app = express()

app.use(bodyParser.json())

app.use('/products', productRouter)

app.use('/customers', customerRouter)

app.use('/orders', orderRouter)

app.get('/', (req, res) => res.send('API da lojinha'))

app.listen(3000, () => {
    console.log('Example app ouvindo a porta 3000')
}) 