const knex = require('./knex')
const { validate } = require('cpf-check');

/*
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


*/

console.log(validate("00463999924"))



