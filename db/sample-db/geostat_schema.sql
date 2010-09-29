--
-- Name: world_cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE world_cities (
    gid serial NOT NULL,
    id integer,
    attrib smallint,
    mgcc smallint,
    admin_code smallint,
    ufi integer,
    population integer,
    name character varying(250)
);

SELECT AddGeometryColumn('public', 'world_cities', 'the_geom', 4326, 'POINT', 2);

--
-- Name: world_factbk_simplified; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE world_factbk_simplified (
    gid integer NOT NULL,
    polyid integer,
    fips10 character varying(3),
    country character varying(44),
    continent character varying(13),
    area integer,
    population bigint,
    birth_rt double precision,
    death_rt double precision,
    inf_mort double precision,
    life_exp double precision,
    fertility double precision,
    hivaidpct double precision,
    hivaidppl integer,
    hivaiddth integer,
    gdp bigint,
    gdp_grow double precision,
    gdp_pc integer,
    labor_frc integer,
    unemploy double precision,
    inflation double precision,
    invst_pct double precision,
    pub_debt double precision,
    indprd_gr double precision,
    elec_prd bigint,
    elec_con bigint,
    oil_prod integer,
    oil_cons integer,
    oil_exp integer,
    oil_imp integer,
    oil_res bigint,
    ngas_prd bigint,
    ngas_cons bigint,
    ngas_exp bigint,
    ngas_imp bigint,
    ngas_res bigint,
    cur_acct bigint,
    exports bigint,
    imports bigint,
    forgn_exc bigint,
    ext_debt bigint,
    telephone integer,
    cellphones integer,
    inet_host integer,
    intrnetu integer,
    airports integer,
    railways integer,
    roadways integer,
    waterways integer,
    mrct_mrn smallint,
    mil_exp bigint,
    gdp_milp double precision
);


SELECT AddGeometryColumn('public', 'world_factbk_simplified', 'simplify', -1, 'MULTIPOLYGON', 2);

--
-- Name: world_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY world_cities
    ADD CONSTRAINT world_cities_pkey PRIMARY KEY (gid);


--
-- Name: world_factbk_simplified_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY world_factbk_simplified
    ADD CONSTRAINT world_factbk_simplified_pkey PRIMARY KEY (gid);


--
-- Name: world_cities_the_geom_gist; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX world_cities_the_geom_gist ON world_cities USING gist (the_geom);


--
-- Name: world_factbk_simplified_simplify_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX world_factbk_simplified_simplify_idx ON world_factbk_simplified USING gist (simplify);

--
-- PostgreSQL database dump complete
--

