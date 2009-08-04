SET default_with_oids = true;

--
-- Name: camipro; Type: TABLE; Schema: public; Owner: www-data; Tablespace: 
--

CREATE TABLE camipro (
    address character varying(20),
    planning_day date,
    planning_time character varying(8),
    planning_mode character varying(3)
);


--
-- Name: epfl_routing_results_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE epfl_routing_results_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

SET default_with_oids = false;

--
-- Name: lines2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lines2 (
    gid serial NOT NULL,
    node1_id numeric(20,0),
    node2_id numeric(20,0),
    level_1 numeric(20,0),
    level_2 numeric(20,0),
    length numeric,
    network numeric(20,0),
    cami character varying(20),
    cami_rev character varying(20),
    door character varying(20),
    door_rev character varying(20),
    "type" character varying(20),
    attr_id character varying(20)
);

SELECT AddGeometryColumn('public', 'lines2', 'the_geom', -1, 'MULTILINESTRING', 2);
SELECT AddGeometryColumn('public', 'lines2', 'geom', -1, 'LINESTRING', 2);

SET default_with_oids = true;

--
-- Name: lines_attributes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lines_attributes (
    attr_id character varying(20) NOT NULL,
    comment_fr text,
    comment_en text,
    image_filename text
);


--
-- Name: more_lines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE more_lines (
    gid serial NOT NULL,
    source_id character varying,
    target_id character varying,
    "type" character varying,
    type_rev character varying,
    the_geom geometry,
    edge_id integer
);

SELECT AddGeometryColumn('public', 'more_lines', 'the_geom', -1, 'MULTILINESTRING', 2);

--
-- Name: more_lines_edges; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE more_lines_edges (
    id serial NOT NULL,
    source integer,
    target integer,
    cost double precision,
    reverse_cost double precision
);


--
-- Name: more_lines_vertices; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE more_lines_vertices (
    id serial NOT NULL,
    geom_id character varying NOT NULL
);


SELECT AddGeometryColumn('public', 'more_lines_vertices', 'the_geom', -1, 'POINT', 2);

SET default_with_oids = false;

--
-- Name: nodes2; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nodes2 (
    gid serial NOT NULL,
    node_id numeric(20,0),
    "level" numeric(20,0),
    room character varying(20),
    attr_id character varying(20)
);

SELECT AddGeometryColumn('public', 'nodes2', 'the_geom', -1, 'MULTIPOINT', 2);
SELECT AddGeometryColumn('public', 'nodes2', 'geom', -1, 'POINT', 2);

SET default_with_oids = true;

--
-- Name: nodes_attributes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nodes_attributes (
    attr_id character varying(20) NOT NULL,
    comment_fr text,
    comment_en text,
    image_filename text
);


ALTER TABLE public.nodes_attributes OWNER TO postgres;

--
-- Name: routing_results_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE routing_results_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: lines2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lines2
    ADD CONSTRAINT lines2_pkey PRIMARY KEY (gid);


--
-- Name: lines_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lines_attributes
    ADD CONSTRAINT lines_attributes_pkey PRIMARY KEY (attr_id);


--
-- Name: more_lines_edges_source_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY more_lines_edges
    ADD CONSTRAINT more_lines_edges_source_key UNIQUE (source, target);


--
-- Name: more_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY more_lines
    ADD CONSTRAINT more_lines_pkey PRIMARY KEY (gid);


--
-- Name: more_lines_vertices_geom_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY more_lines_vertices
    ADD CONSTRAINT more_lines_vertices_geom_id_key UNIQUE (geom_id);


--
-- Name: nodes2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nodes2
    ADD CONSTRAINT nodes2_pkey PRIMARY KEY (gid);


--
-- Name: nodes_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nodes_attributes
    ADD CONSTRAINT nodes_attributes_pkey PRIMARY KEY (attr_id);

--
-- Name: geom_lines2_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX geom_lines2_idx ON lines2 USING gist (geom);


--
-- Name: geom_nodes2_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX geom_nodes2_idx ON nodes2 USING gist (geom);


--
-- Name: more_lines_edge_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX more_lines_edge_idx ON more_lines USING btree (edge_id);


--
-- Name: more_lines_edges_source_target_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX more_lines_edges_source_target_idx ON more_lines_edges USING btree (source, target);


--
-- Name: more_lines_vertices_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX more_lines_vertices_id_idx ON more_lines_vertices USING btree (id);

--
-- PostgreSQL database dump complete
--

