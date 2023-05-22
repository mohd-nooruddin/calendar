#!/usr/bin/bash

#Taking Credentials from database_credentials.sh file 
source database_credentials.sh

# Here I'm establishing the connection with database by the below command 
establish_connection(){
    mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -P"$port_num" -e "USE "$mysql_name";"
    # mysql -h"$mysql_hostname" -u"$mysql_user" -p"$mysql_passwd" --port "$port_num" --protocol=TCP railway
    # mysql -h"$mysql_user" -p""
}

establish_connection