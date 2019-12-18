--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.11
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

-- Started on 2019-12-18 09:48:12 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11791)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 28387)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 28385)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 177
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 172 (class 1259 OID 28327)
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 28325)
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 171
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- TOC entry 174 (class 1259 OID 28335)
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 28333)
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 173
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- TOC entry 182 (class 1259 OID 28450)
-- Name: order_itens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_itens (
    id integer NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    amount integer NOT NULL,
    price_unit numeric(8,2) NOT NULL,
    total numeric(8,2) NOT NULL
);


ALTER TABLE public.order_itens OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 28448)
-- Name: order_itens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_itens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_itens_id_seq OWNER TO postgres;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 181
-- Name: order_itens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_itens_id_seq OWNED BY public.order_itens.id;


--
-- TOC entry 180 (class 1259 OID 28422)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id bigint NOT NULL,
    total numeric(8,2) NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 28420)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 179
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 176 (class 1259 OID 28343)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    sku bigint NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 28341)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 175
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 1899 (class 2604 OID 28390)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 28330)
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 28338)
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 28453)
-- Name: order_itens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_itens ALTER COLUMN id SET DEFAULT nextval('public.order_itens_id_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 28425)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 1896 (class 2604 OID 28346)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 2042 (class 0 OID 28387)
-- Dependencies: 178
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, cpf, email, created_at, updated_at) FROM stdin;
1	Maria Aparecida de Souza	00463999924	mariasouza@email.com	2019-12-16 20:11:20.031592-03	2019-12-16 20:11:20.031592-03
3	JJ	34391642093	jj@email.com	2019-12-16 20:48:42.771868-03	2019-12-16 20:48:42.771868-03
4	João da Silva	16666722035	silva@email.com	2019-12-17 11:21:23.670314-03	2019-12-17 11:21:23.670314-03
\.


--
-- TOC entry 2036 (class 0 OID 28327)
-- Dependencies: 172
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20191215031450_create_table_products.js	1	2019-12-15 20:32:43.408-03
2	20191216191301_create_table_customers.js	2	2019-12-16 19:25:32.52-03
3	20191217131145_create_table_orders.js	3	2019-12-17 13:25:11.705-03
4	20191217132803_create_table_order_itens.js	4	2019-12-17 13:33:37.498-03
\.


--
-- TOC entry 2038 (class 0 OID 28335)
-- Dependencies: 174
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- TOC entry 2046 (class 0 OID 28450)
-- Dependencies: 182
-- Data for Name: order_itens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_itens (id, order_id, product_id, amount, price_unit, total) FROM stdin;
1	1	5	1	109.90	109.90
2	1	11	1	79.90	79.90
3	2	5	1	109.90	109.90
5	3	5	1	109.90	109.90
7	4	5	1	109.90	109.90
9	5	5	1	109.90	109.90
11	6	5	1	109.90	109.90
13	7	5	1	109.90	109.90
15	8	5	1	109.90	109.90
17	9	5	1	109.90	109.90
19	10	5	1	109.90	109.90
21	11	5	1	109.90	109.90
22	11	11	1	79.90	79.90
23	14	5	1	109.90	109.90
24	14	11	1	79.90	79.90
25	15	5	1	109.90	109.90
26	15	11	1	79.90	79.90
27	16	5	1	109.90	109.90
28	16	11	1	79.90	79.90
29	17	5	1	109.90	109.90
30	17	11	1	79.90	79.90
31	18	5	1	109.90	109.90
32	18	11	1	79.90	79.90
\.


--
-- TOC entry 2044 (class 0 OID 28422)
-- Dependencies: 180
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, total, status, created_at) FROM stdin;
1	1	189.80	CONCLUDED	2019-12-17 18:25:48.513787-03
2	1	189.80	CONCLUDED	2019-12-17 18:26:58.322848-03
3	1	189.80	CONCLUDED	2019-12-17 18:30:38.674525-03
4	1	189.80	CONCLUDED	2019-12-17 18:33:31.853495-03
5	1	189.80	CONCLUDED	2019-12-17 18:33:41.717791-03
6	1	189.80	CONCLUDED	2019-12-17 22:16:12.617424-03
7	1	189.80	CONCLUDED	2019-12-17 22:21:46.89475-03
8	1	189.80	CONCLUDED	2019-12-17 22:24:49.998019-03
9	1	189.80	CONCLUDED	2019-12-17 22:25:50.634404-03
10	1	189.80	CONCLUDED	2019-12-17 22:25:58.53351-03
11	1	189.80	CONCLUDED	2019-12-18 00:21:32.657663-03
12	1	189.80	CONCLUDED	2019-12-18 00:22:10.419967-03
13	1	189.80	CONCLUDED	2019-12-18 00:24:38.9442-03
14	1	189.80	CONCLUDED	2019-12-18 00:39:53.322712-03
15	1	189.80	CONCLUDED	2019-12-18 00:52:29.356588-03
16	1	189.80	CONCLUDED	2019-12-18 01:00:44.438883-03
18	1	189.80	CANCELED	2019-12-18 03:22:20.705156-03
17	1	189.80	CANCELED	2019-12-18 01:07:04.76166-03
\.


--
-- TOC entry 2040 (class 0 OID 28343)
-- Dependencies: 176
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, sku, name, price, created_at, updated_at) FROM stdin;
5	8552515751438644	Casaco Jaqueta Outletdri Inverno Jacquard	109.90	2019-12-15 21:22:02.202178-03	2019-12-15 21:22:02.202178-03
11	1	a	1.00	2019-12-16 18:22:44.392382-03	2019-12-16 18:22:44.392382-03
13	2	2	1.00	2019-12-16 18:26:51.701518-03	2019-12-16 18:26:51.701518-03
\.


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 177
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 4, true);


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 171
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 4, true);


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 173
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 181
-- Name: order_itens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_itens_id_seq', 32, true);


--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 179
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 18, true);


--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 175
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 13, true);


--
-- TOC entry 1916 (class 2606 OID 28399)
-- Name: customers customers_cpf_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_cpf_unique UNIQUE (cpf);


--
-- TOC entry 1918 (class 2606 OID 28401)
-- Name: customers customers_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_unique UNIQUE (email);


--
-- TOC entry 1920 (class 2606 OID 28397)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 1908 (class 2606 OID 28340)
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- TOC entry 1906 (class 2606 OID 28332)
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 1924 (class 2606 OID 28455)
-- Name: order_itens order_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_itens
    ADD CONSTRAINT order_itens_pkey PRIMARY KEY (id);


--
-- TOC entry 1922 (class 2606 OID 28428)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 1910 (class 2606 OID 28354)
-- Name: products products_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_unique UNIQUE (name);


--
-- TOC entry 1912 (class 2606 OID 28350)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 1914 (class 2606 OID 28352)
-- Name: products products_sku_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sku_unique UNIQUE (sku);


--
-- TOC entry 1926 (class 2606 OID 28456)
-- Name: order_itens order_itens_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_itens
    ADD CONSTRAINT order_itens_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 1927 (class 2606 OID 28461)
-- Name: order_itens order_itens_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_itens
    ADD CONSTRAINT order_itens_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 1925 (class 2606 OID 28429)
-- Name: orders orders_customer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_foreign FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-12-18 09:48:12 -03

--
-- PostgreSQL database dump complete
--

