
# I2B2Exporter

Tool to export an [I2B2](https://i2b2.org/) query into a sqllite file 

# Installation and Configuration 

This script was written to run with Python 3 

## Set up environment 

- configure the database connection parameters by copying `config/config_example.json` to `config/config.json` and editting as appropriate
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