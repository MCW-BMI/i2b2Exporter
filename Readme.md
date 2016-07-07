
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

# Acknowledgments 

 This code  was supported by the  National Center for Advancing Translational Sciences, National Institutes of Health,
 through Grant Number UL1TR001436. Its contents are solely the responsibility of the authors and do not necessarily
 represent the official views of the NIH.