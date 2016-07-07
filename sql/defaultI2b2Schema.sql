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

CREATE INDEX ix_concept_dimension_upload_id ON concept_dimension (upload_id);
CREATE INDEX ix_modifier_dimension_upload_id ON modifier_dimension (upload_id);
CREATE INDEX ix_observation_fact_concept_cd ON observation_fact (concept_cd);
CREATE INDEX ix_observation_fact_encounter_num ON observation_fact (encounter_num);
CREATE INDEX ix_observation_fact_modifier_cd ON observation_fact (modifier_cd);
CREATE INDEX ix_observation_fact_nval_num ON observation_fact (nval_num);
CREATE INDEX ix_observation_fact_patient_num ON observation_fact (patient_num);
CREATE INDEX ix_observation_fact_tval_char ON observation_fact (tval_char);
CREATE INDEX ix_observation_fact_valtype_cd ON observation_fact (valtype_cd);
CREATE INDEX ix_patient_dimension_upload_id ON patient_dimension (upload_id);
CREATE INDEX ix_visit_dimension_upload_id ON visit_dimension (upload_id);
CREATE INDEX observation_fact_pk ON observation_fact (encounter_num, concept_cd, provider_id, start_date, modifier_cd, instance_num);
CREATE INDEX pd_idx_allpatientdim ON patient_dimension (patient_num, vital_status_cd, birth_date, death_date, sex_cd, age_in_years_num, language_cd, race_cd, marital_status_cd, religion_cd, zip_cd, income_cd);
CREATE INDEX pd_idx_dates ON patient_dimension (patient_num, vital_status_cd, birth_date, death_date);
CREATE INDEX pd_idx_statecityzip ON patient_dimension (statecityzip_path, patient_num);
CREATE INDEX visitdim_en_pn_lp_io_sd_idx ON visit_dimension (encounter_num, patient_num, location_path, inout_cd, start_date, end_date, length_of_stay);
CREATE INDEX visitdim_std_edd_idx ON visit_dimension (start_date, end_date);