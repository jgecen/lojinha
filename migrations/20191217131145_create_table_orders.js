exports.up = function (knex) {
    return knex.schema.createTable('orders', function (table) {
        table.increments('id');
        table.biginteger('customer_id').references("id").inTable("customers").notNullable();
        table.decimal('total').notNullable();
        table.string('status').notNullable();
        table.timestamp('created_at').defaultTo(knex.fn.now())
    })
};

exports.down = function (knex) {
    return knex.schema
        .dropTable("orders")
};