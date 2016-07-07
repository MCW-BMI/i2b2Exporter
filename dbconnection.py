import cx_Oracle
import json
import logging

FORMAT = '%(asctime)-15s  %(message)s'
logging.basicConfig(format=FORMAT)
d = { }
logger = logging.getLogger('dbconnection')

def load_config(config_file="config/config.json"):
    with open(config_file) as f:
        config_dict = json.load(f)
    return config_dict

def get_connection(connection_params=load_config()):
    dsn_tns=cx_Oracle.makedsn(host=connection_params["host"],
                              port=connection_params["port"],
                              sid=connection_params["SID"])

    connection=cx_Oracle.connect(user=connection_params["user"],
                                 password=connection_params["password"],
                                 dsn=dsn_tns)
    return connection



def executeScriptsFromFile(filename, conn):
    """ Execute the filename as a series of SQL statements separated by commas on the conn connection """
    # Open and read the file as a single buffer
    fd = open(filename, 'r')
    sqlFile = fd.read()
    fd.close()

    # all SQL commands (split on ';')
    sqlCommands = sqlFile.split(';')


    # Execute every command from the input file
    for command in sqlCommands:
        # logger.warning('Setting up sqllite file : %s', command, extra=d)
        # This will skip and report errors
        # For example, if the tables do not yet exist, this will skip over
        # the DROP TABLE commands

        try:
            conn.execute(command)

        except OperationalError as msg:
            print ( "Command skipped: ", msg )