# lojinha
Teste para a vaga de Desenvolvedor Back-end na Empresa Devninjas

# Instalçãoes

Banco de dados PostgreSQL, crie um bancoo de dados:

>CREATE DATABASE lojinha;

>CREATE DATABASE lojinha_test;


Instale o nvm

Instale a versão do node v12.13.1

Instale a última versão do yarn

Instalar o knex e pg globalmente

>npm install knex -g

>npm install pg -g

Na pasta do projeto execute

>npm install

Agora para criar os banco de dados

>knex migrate:latest

>knex migrate:latest --env test


