const knex = require('./knex')


knex('products')
    .returning(['id', 'sku'])
    .insert({
        "sku": 8552515751438644,
        "name": "Casaco Jaqueta Outletdri Inverno Jacquard",
        "price": 109.90
    }).then((res) => {
        console.log(res)
    }).catch((err) => {
        console.log(err.detail)
    })

    




