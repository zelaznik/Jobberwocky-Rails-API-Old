--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    total numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE orders OWNER TO "zMac";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO "zMac";

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: placements; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE placements (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE placements OWNER TO "zMac";

--
-- Name: placements_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE placements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE placements_id_seq OWNER TO "zMac";

--
-- Name: placements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE placements_id_seq OWNED BY placements.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    title character varying(255) DEFAULT ''::character varying,
    price numeric DEFAULT 0.0,
    published boolean DEFAULT false,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE products OWNER TO "zMac";

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO "zMac";

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "zMac";

--
-- Name: users; Type: TABLE; Schema: public; Owner: zMac; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    auth_token character varying(255) DEFAULT ''::character varying
);


ALTER TABLE users OWNER TO "zMac";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: zMac
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "zMac";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zMac
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY placements ALTER COLUMN id SET DEFAULT nextval('placements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: zMac
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY orders (id, user_id, total, created_at, updated_at) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('orders_id_seq', 3, true);


--
-- Data for Name: placements; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY placements (id, order_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: placements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('placements_id_seq', 6, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY products (id, title, price, published, user_id, created_at, updated_at) FROM stdin;
1610	GPS Video Viewer	96.136872600894	t	1	2016-04-07 17:23:11.832457	2016-04-07 18:42:22.758599
1598	Tag Bridge	79.96	f	1	2016-04-07 17:23:11.816225	2016-04-07 18:50:48.78819
1599	Remote Kit	84.7307255481325	f	1	2016-04-07 17:23:11.818816	2016-04-07 17:23:11.818816
1600	Disc Adapter	88.7369024355011	f	1	2016-04-07 17:23:11.820143	2016-04-07 17:23:11.820143
1601	Tag Remote Bridge	57.1209308013282	f	1	2016-04-07 17:23:11.82145	2016-04-07 17:23:11.82145
1602	Gel Input Kit	38.4196139738658	f	1	2016-04-07 17:23:11.822784	2016-04-07 17:23:11.822784
1603	Electric Performance Mount	53.054290484826	f	1	2016-04-07 17:23:11.824043	2016-04-07 17:23:11.824043
1604	Portable Bracket	22.6671910880982	f	1	2016-04-07 17:23:11.825268	2016-04-07 17:23:11.825268
1605	HD Amplifier	95.2308311778174	f	1	2016-04-07 17:23:11.826444	2016-04-07 17:23:11.826444
1606	Portable Bridge	60.5148780015013	f	1	2016-04-07 17:23:11.827586	2016-04-07 17:23:11.827586
1607	Air Remote Controller	38.1900530653387	f	1	2016-04-07 17:23:11.828727	2016-04-07 17:23:11.828727
1608	Portable Tag Adapter	86.9939486582148	f	1	2016-04-07 17:23:11.829999	2016-04-07 17:23:11.829999
1609	GPS Side Transmitter	98.0002950944393	f	1	2016-04-07 17:23:11.831201	2016-04-07 17:23:11.831201
1611	Video Adapter	96.8116284819212	f	1	2016-04-07 17:23:11.833976	2016-04-07 17:23:11.833976
1612	Remote Video Tuner	81.4355499256295	f	1	2016-04-07 17:23:11.835182	2016-04-07 17:23:11.835182
1613	Direct Amplifier	33.9434123875764	f	1	2016-04-07 17:23:11.836309	2016-04-07 17:23:11.836309
1614	GPS Compressor	47.7374781186645	f	1	2016-04-07 17:23:11.837567	2016-04-07 17:23:11.837567
1615	Tag Bracket	15.7792997160848	f	1	2016-04-07 17:23:11.838781	2016-04-07 17:23:11.838781
1616	Audible Direct Receiver	43.5637917914303	f	1	2016-04-07 17:23:11.839947	2016-04-07 17:23:11.839947
1617	Air Component	3.58901449152028	f	1	2016-04-07 17:23:11.841087	2016-04-07 17:23:11.841087
1618	Input Tuner	20.1386380806211	f	1	2016-04-07 17:23:11.842251	2016-04-07 17:23:11.842251
1619	Electric Amplifier	40.450476342778	f	1	2016-04-07 17:23:11.843417	2016-04-07 17:23:11.843417
1621	HD Remote Kit	34.4068785507168	f	1	2016-04-07 17:23:11.845793	2016-04-07 17:23:11.845793
1622	Disc Bracket	24.4327785965248	f	1	2016-04-07 17:23:11.846976	2016-04-07 17:23:11.846976
1623	Auto GPS Bridge	13.0765533887348	f	2	2016-04-07 17:23:11.938729	2016-04-07 17:23:11.938729
1624	Power Compressor	75.6959336946372	f	2	2016-04-07 17:23:11.940752	2016-04-07 17:23:11.940752
1625	Power Bridge	18.7024254229656	f	2	2016-04-07 17:23:11.943214	2016-04-07 17:23:11.943214
1626	Portable Adapter	52.0368407162659	f	2	2016-04-07 17:23:11.945086	2016-04-07 17:23:11.945086
1627	Gel Compressor	13.6786832310652	f	2	2016-04-07 17:23:11.94682	2016-04-07 17:23:11.94682
1628	Portable Controller	50.7670922088921	f	2	2016-04-07 17:23:11.948601	2016-04-07 17:23:11.948601
1629	Portable Tuner	8.40498859460716	f	3	2016-04-07 17:23:12.031251	2016-04-07 17:23:12.031251
1630	GPS Amplifier	66.690149497842	f	3	2016-04-07 17:23:12.032692	2016-04-07 17:23:12.032692
1631	Gel Tuner	0.489719061842686	f	3	2016-04-07 17:23:12.033975	2016-04-07 17:23:12.033975
1632	Power Side Compressor	34.7833155374411	f	3	2016-04-07 17:23:12.035396	2016-04-07 17:23:12.035396
1633	Video Component	89.4159120162316	f	3	2016-04-07 17:23:12.036716	2016-04-07 17:23:12.036716
1634	HD Transmitter	47.6958125248577	f	3	2016-04-07 17:23:12.037924	2016-04-07 17:23:12.037924
1635	Power Adapter	81.5357049225153	f	4	2016-04-07 17:23:12.123598	2016-04-07 17:23:12.123598
1636	Remote Kit	35.9667563406338	f	4	2016-04-07 17:23:12.125084	2016-04-07 17:23:12.125084
1637	Direct Component	26.5083252053409	f	4	2016-04-07 17:23:12.126551	2016-04-07 17:23:12.126551
1638	Gel Tag Case	18.6234031959263	f	4	2016-04-07 17:23:12.128126	2016-04-07 17:23:12.128126
1639	Input Filter	93.3335679120848	f	4	2016-04-07 17:23:12.12973	2016-04-07 17:23:12.12973
1640	GPS Air Adapter	86.8324634453469	f	4	2016-04-07 17:23:12.131291	2016-04-07 17:23:12.131291
1641	Side Video Viewer	12.5564381180856	f	5	2016-04-07 17:23:12.213442	2016-04-07 17:23:12.213442
1642	Input Disc System	61.2567770797203	f	5	2016-04-07 17:23:12.214696	2016-04-07 17:23:12.214696
1643	Electric Digital Filter	41.9621209797495	f	5	2016-04-07 17:23:12.215942	2016-04-07 17:23:12.215942
1644	Input Component	13.4248580126649	f	5	2016-04-07 17:23:12.217077	2016-04-07 17:23:12.217077
1645	Direct Video Bridge	34.9721161279672	f	5	2016-04-07 17:23:12.218192	2016-04-07 17:23:12.218192
1646	Portable Filter	46.5183594713735	f	5	2016-04-07 17:23:12.219283	2016-04-07 17:23:12.219283
1647	Output Side Adapter	68.8815017234445	f	6	2016-04-07 17:23:12.305847	2016-04-07 17:23:12.305847
1648	Electric Viewer	90.0504520210566	f	6	2016-04-07 17:23:12.307149	2016-04-07 17:23:12.307149
1649	Output GPS Bridge	77.9910463479442	f	6	2016-04-07 17:23:12.308265	2016-04-07 17:23:12.308265
1650	Air Case	71.2234057263504	f	6	2016-04-07 17:23:12.309402	2016-04-07 17:23:12.309402
1651	Portable Mount	32.4777358466057	f	6	2016-04-07 17:23:12.310524	2016-04-07 17:23:12.310524
1652	Audible Gel Viewer	9.23686968926924	f	6	2016-04-07 17:23:12.311746	2016-04-07 17:23:12.311746
1653	Gel Viewer	76.4244157737082	f	7	2016-04-07 17:23:12.396171	2016-04-07 17:23:12.396171
1654	HD Kit	78.0229118672771	f	7	2016-04-07 17:23:12.397417	2016-04-07 17:23:12.397417
1655	Electric Video Transmitter	0.498531614870124	f	7	2016-04-07 17:23:12.398589	2016-04-07 17:23:12.398589
1656	Portable Electric Compressor	54.3201108651748	f	7	2016-04-07 17:23:12.399882	2016-04-07 17:23:12.399882
1657	Air Kit	45.3174909317752	f	7	2016-04-07 17:23:12.40109	2016-04-07 17:23:12.40109
1658	GPS Gel Component	61.4878615203068	f	7	2016-04-07 17:23:12.402253	2016-04-07 17:23:12.402253
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('products_id_seq', 1658, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY schema_migrations (version) FROM stdin;
20140622003340
20160327202531
20160331111656
20160407121204
20160407121551
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zMac
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, auth_token) FROM stdin;
2	sim.thiel@olson.ca	$2a$10$vtBFM8gG7o9cHjSiSI5B.uaGn/l5zODCAELlaBHHrB1RgXjBxvkiW	\N	\N	\N	0	\N	\N	\N	\N	2016-04-07 17:23:11.93606	2016-04-07 17:23:11.93606	vyfsE2Q46ALyznEstSiX
3	cortez@mckenzietorp.ca	$2a$10$hMEUCKljk5Sflm0Ff3xZpe/ZyOII4Mcy.GFbN6eQICRltOTMIewOC	\N	\N	\N	0	\N	\N	\N	\N	2016-04-07 17:23:12.028995	2016-04-07 17:23:12.028995	tEMky7pCqyL4sz22FHUk
4	arden@greenfelderskiles.biz	$2a$10$kUwLesExjpaOQI/cIQxuF.TA9grgOQdN7SvDgDCj7cpDtP66Lo/Gi	\N	\N	\N	0	\N	\N	\N	\N	2016-04-07 17:23:12.121126	2016-04-07 17:23:12.121126	5BpCxjRWGxz4tFVqLSbw
5	mustafa_moore@mrazgoodwin.us	$2a$10$pgK78/BtI5BpPahvU8hUU.8Ejc2yQwhj.4kQz/pmWsc.JzYGjnoTS	\N	\N	\N	0	\N	\N	\N	\N	2016-04-07 17:23:12.211298	2016-04-07 17:23:12.211298	4SyG8pWze6whK_zBWxrR
6	johnpaul@glover.co.uk	$2a$10$37OeYKSwa.ZSQZGNIlNeSu9fu4I9tJ4PyiXOLDDIfWTcWvDxgAwI6	\N	\N	\N	0	\N	\N	\N	\N	2016-04-07 17:23:12.3036	2016-04-07 17:23:12.3036	Y8zVNwHs7Sh75yxqM9fA
7	elenor@ondrickalegros.biz	$2a$10$Mi9lmHHI8To1W.VWTEGDv.dv9PoPli1xOAHkDqp5Ht0DR2pIllv/y	\N	\N	\N	0	\N	\N	\N	\N	2016-04-07 17:23:12.394058	2016-04-07 17:23:12.394058	t5oA42s_fzBVvk-LFKVt
1	zelaznik@yahoo.com	$2a$10$bcfHkT4klgC.K6CSi7.b7.4r/s4UFzjpQxmXY7I3owvVF7uazf24y	\N	\N	\N	4	2016-04-07 19:44:19.835014	2016-04-07 18:50:30.360133	127.0.0.1	127.0.0.1	2016-04-07 17:23:11.804197	2016-04-07 19:44:19.872447	94SaZygZk6xzDMsZvwur
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zMac
--

SELECT pg_catalog.setval('users_id_seq', 139, true);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: placements_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY placements
    ADD CONSTRAINT placements_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: zMac; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_orders_on_user_id ON orders USING btree (user_id);


--
-- Name: index_placements_on_order_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_placements_on_order_id ON placements USING btree (order_id);


--
-- Name: index_placements_on_product_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_placements_on_product_id ON placements USING btree (product_id);


--
-- Name: index_products_on_user_id; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE INDEX index_products_on_user_id ON products USING btree (user_id);


--
-- Name: index_users_on_auth_token; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_auth_token ON users USING btree (auth_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: zMac; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: zMac
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "zMac";
GRANT ALL ON SCHEMA public TO "zMac";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

