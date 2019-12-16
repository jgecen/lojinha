exports.up = function(knex) {
    return knex.schema.createTable('customers', function(table) {
        table.increments('id');        
        table.string('name').notNullable();
        table.string('cpf').notNullable().unique();
        table.string('email').notNullable().unique();
        table.timestamp('created_at').defaultTo(knex.fn.now())
        table.timestamp('updated_at').defaultTo(knex.fn.now())
      })
};

exports.down = function(knex) {
    return knex.schema
    .dropTable("customers")
};
