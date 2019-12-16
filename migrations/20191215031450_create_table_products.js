exports.up = function(knex) {
    return knex.schema.createTable('products', function(table) {
        table.increments('id');
        table.biginteger('sku').notNullable().unique();
        table.string('name').notNullable().unique();
        table.decimal('price').notNullable();
        table.timestamp('created_at').defaultTo(knex.fn.now())
        table.timestamp('updated_at').defaultTo(knex.fn.now())
      })
};

exports.down = function(knex) {
    return knex.schema
    .dropTable("products")
};
