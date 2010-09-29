--
-- Name: parkings; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE parkings (
    parking_id serial NOT NULL,
    name character varying(100),
    elevation smallint,
    range_id smallint,
    lat double precision,
    long double precision,
    country_id character(2),
    source smallint,
    x integer,
    y integer,
    blur boolean
);

SELECT AddGeometryColumn('public', 'parkings', 'the_geom', 4326, 'POINT', 2);

-- SET default_with_oids = true;

--
-- Name: parkings_out; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE parkings_out (
    parking_id integer NOT NULL,
    name character varying(100),
    elevation smallint,
    range_id smallint,
    lat double precision,
    long double precision,
    country_id character(2),
    source smallint,
    blur boolean
);

SELECT AddGeometryColumn('public', 'parkings_out', 'geom', 4326, 'POINT', 2);

-- SET default_with_oids = false;

--
-- Name: refuges; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE refuges (
    refuge_id serial NOT NULL,
    id integer,
    name character varying(100),
    elevation smallint,
    region_id smallint,
    lat double precision,
    long double precision,
    country_id character(2),
    range_id smallint,
    source smallint,
    x integer,
    y integer,
    blur boolean
);

SELECT AddGeometryColumn('public', 'refuges', 'the_geom', 4326, 'POINT', 2);

-- SET default_with_oids = true;

--
-- Name: refuges_out; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE refuges_out (
    refuge_id integer NOT NULL,
    id integer,
    name character varying(100),
    elevation smallint,
    region_id smallint,
    lat double precision,
    long double precision,
    country_id character(2),
    range_id smallint,
    source smallint,
    blur boolean
);

SELECT AddGeometryColumn('public', 'refuges_out', 'geom', 4326, 'POINT', 2);

-- SET default_with_oids = false;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE sites (
    site_id serial NOT NULL,
    id integer,
    name character varying(100),
    country_id character(2),
    region_id smallint,
    lat double precision,
    long double precision,
    lambertx integer,
    lamberty integer,
    source smallint,
    x integer,
    y integer,
    blur boolean
);


SELECT AddGeometryColumn('public', 'sites', 'the_geom', 4326, 'POINT', 2);

-- SET default_with_oids = true;

--
-- Name: sites_out; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE sites_out (
    site_id integer NOT NULL,
    id integer,
    name character varying(100),
    country_id character(2),
    region_id smallint,
    lat double precision,
    long double precision,
    lambertx real,
    lamberty real,
    source smallint,
    blur boolean
);

SELECT AddGeometryColumn('public', 'sites_out', 'geom', 4326, 'POINT', 2);

-- SET default_with_oids = false;

--
-- Name: sommets; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE sommets (
    sommet_id serial NOT NULL,
    id integer,
    name character varying(100),
    elevation smallint,
    region_id smallint,
    x integer,
    y integer,
    lat double precision,
    long double precision,
    gps character varying(100),
    source smallint,
    blur boolean
);

SELECT AddGeometryColumn('public', 'sommets', 'the_geom', 4326, 'POINT', 2);

-- SET default_with_oids = true;

--
-- Name: sommets_out; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE sommets_out (
    sommet_id integer NOT NULL,
    id integer,
    name character varying(100),
    elevation smallint,
    region_id smallint,
    x real,
    y real,
    lat double precision,
    long double precision,
    gps character varying(100),
    source smallint,
    blur boolean
);

SELECT AddGeometryColumn('public', 'sommets_out', 'geom', 4326, 'POINT', 2);

-- SET default_with_oids = false;

--
-- Name: parkings_out_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY parkings_out
    ADD CONSTRAINT parkings_out_pkey PRIMARY KEY (parking_id);


--
-- Name: parkings_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY parkings
    ADD CONSTRAINT parkings_pkey PRIMARY KEY (parking_id);


--
-- Name: refuges_out_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY refuges_out
    ADD CONSTRAINT refuges_out_pkey PRIMARY KEY (refuge_id);


--
-- Name: refuges_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY refuges
    ADD CONSTRAINT refuges_pkey PRIMARY KEY (refuge_id);


--
-- Name: sites_out_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY sites_out
    ADD CONSTRAINT sites_out_pkey PRIMARY KEY (site_id);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (site_id);


--
-- Name: sommets_out_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY sommets_out
    ADD CONSTRAINT sommets_out_pkey PRIMARY KEY (sommet_id);


--
-- Name: sommets_pkey; Type: CONSTRAINT; Schema: public; Owner: www-data; Tablespace: 
--

ALTER TABLE ONLY sommets
    ADD CONSTRAINT sommets_pkey PRIMARY KEY (sommet_id);


--
-- Name: parkings_out_geom_1179163421750; Type: INDEX; Schema: public; Owner: www-data; Tablespace: 
--

CREATE INDEX parkings_out_geom_1179163421750 ON parkings_out USING gist (geom);


--
-- Name: refuges_out_geom_1179163421250; Type: INDEX; Schema: public; Owner: www-data; Tablespace: 
--

CREATE INDEX refuges_out_geom_1179163421250 ON refuges_out USING gist (geom);


--
-- Name: sites_out_geom_1179163421359; Type: INDEX; Schema: public; Owner: www-data; Tablespace: 
--

CREATE INDEX sites_out_geom_1179163421359 ON sites_out USING gist (geom);


--
-- Name: sommets_out_geom_1179163421484; Type: INDEX; Schema: public; Owner: www-data; Tablespace: 
--

CREATE INDEX sommets_out_geom_1179163421484 ON sommets_out USING gist (geom);

