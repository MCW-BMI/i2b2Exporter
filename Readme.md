
# I2B2Exporter

Tool to export an [I2B2](https://i2b2.org/) query into a sqllite file 

# Installation and Configuration 

This script was written to run with Python 3 and was tested only to pull data from Oracle at this time. 

## Set up environment 

- configure the database connection parameters by copying `config/config_example.json` to `config/config.json` and edit   as appropriate to talk to your I2B2 schema ( DEMODATA in the default VM provided by I2B2 folks ) 
- Set up the local virtual Environment with : 


    $ . env/bin/active 

## Install Oracle drivers

    $ pip install cx-Oracle

 
# Running the export 


    $ python3 ./i2bExporter.py "Query name" outputfile.db
   
   The "Query Name" is the same that the user sees in the i2b2 webclient . It can be found in the QT_QUERY_MASTER.NAME column of the
    DEMODATA schema .  The "outputfile.db" file is the sqlite file to be created. It will be placed in the current directory. If a file of that name 
    already exists the current one WILL BE DELETED. Here is an example of running the script against a query with a few Patients . 
    
     
    python i2b2Exporter.py  "(t) Commo-BETA2-PneumCommoBETA2@15:47:35" output_pi_connect2.db
    2016-07-07 17:00:50,591  Program Started: started
    We're looking for query  (t) Commo-BETA2-PneumCommoBETA2@15:47:35
    We're going to create output sqllite3 database called:  output_pi_connect2.db
    2016-07-07 17:00:50,996  1
    2016-07-07 17:00:50,997  QT_QUERY_MASTER_ID to process : 17009
    2016-07-07 17:00:51,000  QT_QUERY_INSTANCE_ID to process : 16674
    2016-07-07 17:00:51,004  QT_RESULT_INSTANCE_ID to process : 17677
    2016-07-07 17:00:51,007  Found PATIENT_NUM 24963635
    2016-07-07 17:00:51,007  Found PATIENT_NUM 24965956
    2016-07-07 17:00:51,007  Found PATIENT_NUM 24979524
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25036288
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25037165
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25042113
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25114067
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25165494
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25277501
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25393100
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25456118
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25473393
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25539188
    2016-07-07 17:00:51,007  Found PATIENT_NUM 25553040
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25556177
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25626404
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25628603
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25641989
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25700868
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25766246
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25926646
    2016-07-07 17:00:51,008  Found PATIENT_NUM 25951944
    2016-07-07 17:00:51,008  Found PATIENT_NUM 26024713
    2016-07-07 17:00:51,008  Found PATIENT_NUM 26026733
    2016-07-07 17:00:51,008  Found PATIENT_NUM 26045325
    2016-07-07 17:00:51,008  Removing existing database file : output_pi_connect2.db
    2016-07-07 17:00:51,229  Creating sqlite schema  ...
    2016-07-07 17:00:51,231  Saving existing Patient Records  ...
    2016-07-07 17:00:51,286  Saving existing Visit Records  ...
    2016-07-07 17:01:02,803  Saving existing Concepts Records  ...
    2016-07-07 17:01:09,179  Saving existing Observation Fact Records  ...
    2016-07-07 17:02:03,856  Creating Indexes in sqlite  file ...
    (env) gkowalsk$
  


# Acknowledgments 

 This code  was supported by the  National Center for Advancing Translational Sciences, National Institutes of Health,
 through Grant Number UL1TR001436. Its contents are solely the responsibility of the authors and do not necessarily
 represent the official views of the NIH.