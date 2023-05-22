#!/usr/bin/bash

#Taking Credentials from database_credentials.sh file 
source database_credentials.sh
source establish_connection.sh

# Declaring the variables 
table_name="events"

# Trying to insert data in database using the command below 
insert_data(){
    name="$1"
    event_name="$2"
    date="$3"
    if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; insert into $table_name (full_name,event_name,event_date) values ('$name','$event_name','$date') ;";
    then
        echo "1 Row Inserted succesfully... "
    else
        echo "Failed to insert data"
    fi

}
# Trying to insert data in database using the command below 
insert_data_for_others(){
    name="$1"
    event_name="$2"
    date="$3"
    if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; insert into $table_name (full_name,event_name,event_date,other_events) values ('$name','$event_name','$date','Other') ;";
    then
        echo "1 Row Inserted succesfully... "
    else
        echo "Failed to insert data"
    fi

}

# Trying to insert data in database using the command below 
insert_data_in_meetings(){
    mname="$1"
    mdate="$2"
    start="$3"
    end="$4"
    if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; insert into meeting_events (m_name,m_date,start_time,end_time,event_name) values ('$mname','$mdate','$start','$end','Meeting') ;";
    then
        echo "1 Row Inserted succesfully... "
    else
        echo "Failed to insert data"
    fi

}