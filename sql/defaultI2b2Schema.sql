--- From https://informatics.gpcnetwork.org/trac/Project/attachment/wiki/BuilderSaga/builder_output_schema.sql
CREATE TABLE concept_dimension (
	concept_path VARCHAR(700) NOT NULL,
	concept_cd VARCHAR(50) NOT NULL,
	name_char VARCHAR(2000),
	concept_blob TEXT,
	update_date DATETIME,
	download_date DATETIME,
	import_date DATETIME,
	sourcesystem_cd VARCHAR(50),
	upload_id NUMERIC(38, 0),
	PRIMARY KEY (concept_path)
);
CREATE TABLE job (
	pset INTEGER,
	label VARCHAR,
	concepts VARCHAR,
	name VARCHAR
);
CREATE TABLE modifier_dimension (
	modifier_path VARCHAR(700) NOT NULL,
	modifier_cd VARCHAR(50),
	name_char VARCHAR(2000),
	modifier_blob TEXT,
	update_date DATETIME,
	download_date DATETIME,
	import_date DATETIME,
	sourcesystem_cd VARCHAR(50),
	upload_id NUMERIC(38, 0),
	PRIMARY KEY (modifier_path)
);
CREATE TABLE observation_fact (
	encounter_num NUMERIC(38, 0) NOT NULL,
	patient_num NUMERIC(38, 0) NOT NULL,
	concept_cd VARCHAR(50) NOT NULL,
	provider_id VARCHAR(50) NOT NULL,
	start_date DATETIME NOT NULL,
	modifier_cd VARCHAR(100) NOT NULL,
	instance_num NUMERIC(18, 0) NOT NULL,
	valtype_cd VARCHAR(50),
	tval_char VARCHAR(255),
	nval_num NUMERIC(18, 5),
	valueflag_cd VARCHAR(50),
	quantity_num NUMERIC(18, 5),
	units_cd VARCHAR(50),
	end_date DATETIME,
	location_cd VARCHAR(50),
	observation_blob TEXT,
	confidence_num NUMERIC(18, 5),
	update_date DATETIME,
	download_date DATETIME,
	import_date DATETIME,
	sourcesystem_cd VARCHAR(50),
	upload_id NUMERIC(38, 0)
);
CREATE TABLE patient_dimension (
	patient_num NUMERIC(38, 0) NOT NULL,
	vital_status_cd VARCHAR(50),
	birth_date DATETIME,
	death_date DATETIME,
	sex_cd VARCHAR(50),
	age_in_years_num NUMERIC(38, 0),
	language_cd VARCHAR(50),
	race_cd VARCHAR(50),
	marital_status_cd VARCHAR(50),
	religion_cd VARCHAR(50),
	zip_cd VARCHAR(10),
	statecityzip_path VARCHAR(700),
	income_cd VARCHAR(50),
	patient_blob TEXT,
	update_date DATETIME,
	download_date DATETIME,
	import_date DATETIME,
	sourcesystem_cd VARCHAR(50),
	upload_id NUMERIC(38, 0),
	PRIMARY KEY (patient_num)
);
CREATE TABLE variable (
	id INTEGER,
	item_key VARCHAR,
	concept_path VARCHAR,
	name_char VARCHAR,
	name VARCHAR,
	short_name VARCHAR,
	section VARCHAR,
	redundant BOOLEAN,
	CHECK (redundant IN (0, 1))
);
CREATE TABLE visit_dimension (
	encounter_num NUMERIC(38, 0) NOT NULL,
	patient_num NUMERIC(38, 0) NOT NULL,
	active_status_cd VARCHAR(50),
	start_date DATETIME,
	end_date DATETIME,
	inout_cd VARCHAR(50),
	location_cd VARCHAR(50),
	location_path VARCHAR(900),
	length_of_stay NUMERIC(38, 0),
	visit_blob TEXT,
	update_date DATETIME,
	download_date DATETIME,
	import_date DATETIME,
	sourcesystem_cd VARCHAR(50),
	upload_id NUMERIC(38, 0),
	PRIMARY KEY (encounter_num, patient_num)
);
