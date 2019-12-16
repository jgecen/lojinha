const express = require('express')

const bodyParser = require('body-parser')

const productRouter = require('./routers/product.router')

const app = express()

app.use(bodyParser.json())

app.use('/products', productRouter)

app.get('/', (req, res) => res.send('Hello World'))

app.listen(3000, () => {
    console.log('Example app ouvindo a porta 3000')
}) 