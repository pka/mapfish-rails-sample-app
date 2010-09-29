--
-- Name: lines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lines (
    id serial NOT NULL,
    name character varying DEFAULT 'foo'::character varying
);

SELECT AddGeometryColumn('public', 'lines', 'the_geom', 4326, 'LINESTRING', 2);

--
-- Name: points; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE points (
    id serial NOT NULL,
    name character varying DEFAULT 'foo'::character varying
);

SELECT AddGeometryColumn('public', 'points', 'the_geom', 4326, 'POINT', 2);

--
-- Name: polygons; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE polygons (
    id serial NOT NULL,
    name character varying DEFAULT 'foo'::character varying
);

SELECT AddGeometryColumn('public', 'polygons', 'the_geom', 4326, 'POLYGON', 2);

--
-- Name: lines_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lines
    ADD CONSTRAINT lines_id_pk PRIMARY KEY (id);


--
-- Name: points_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY points
    ADD CONSTRAINT points_id_pk PRIMARY KEY (id);


--
-- Name: polygons_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY polygons
    ADD CONSTRAINT polygons_id_pk PRIMARY KEY (id);

--
-- Name: lines_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX lines_id_idx ON lines USING btree (id);


--
-- Name: lines_the_geom_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX lines_the_geom_index ON lines USING gist (the_geom);


--
-- Name: points_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX points_id_idx ON points USING btree (id);


--
-- Name: points_the_geom_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX points_the_geom_index ON points USING gist (the_geom);


--
-- Name: polygons_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX polygons_id_idx ON polygons USING btree (id);


--
-- Name: polygons_the_geom_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX polygons_the_geom_index ON polygons USING gist (the_geom);
