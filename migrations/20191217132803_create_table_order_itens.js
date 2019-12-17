
exports.up = function (knex) {
    return knex.schema.createTable('order_itens', function (table) {
        table.increments('id');
        table.biginteger('order_id').references("id").inTable("orders").notNullable();
        table.biginteger('product_id').references("id").inTable("products").notNullable();
        table.integer('amount').notNullable();
        table.decimal('price_unit').notNullable();
        table.decimal('total').notNullable();
    })
};

exports.down = function (knex) {
    return knex.schema
        .dropTable("order_itens")
};