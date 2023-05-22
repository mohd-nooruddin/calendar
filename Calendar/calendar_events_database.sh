#!/usr/bin/bash

#Taking Credentials from database_credentials.sh file 
source database_credentials.sh
source establish_connection.sh

# Declaring the variables 
table_name="events"


# Here I'm establishing the connection with database by the below command 
# establish_connection(){
#     mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name;"
# }

# getdata_from_db(){
#     mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select * from $table_name;"
# }

# getdata_in_file(){
#     if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events;" > calendar_events.txt;
#     then
#         echo "Retrieved succesfully... "
#     else
#         echo "Failed to retrieve data"
#     fi
# }
# # Trying to insert data in database using the command below 
# insert_data(){
#     name="$1"
#     event_name="$2"
#     date="$3"
#     if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; insert into $table_name (full_name,event_name,event_date) values ('$name','$event_name','$date') ;";
#     then
#         echo "1 Row Inserted succesfully... "
#     else
#         echo "Failed to insert data"
#     fi

# }
# # Trying to insert data in database using the command below 
# insert_data_for_others(){
#     name="$1"
#     event_name="$2"
#     date="$3"
#     if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; insert into $table_name (full_name,event_name,event_date,other_events) values ('$name','$event_name','$date','Other') ;";
#     then
#         echo "1 Row Inserted succesfully... "
#     else
#         echo "Failed to insert data"
#     fi

# }

# Updating the data based on name
update_data(){
    name=$1
    date=$2
    if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -P"$port_num" -e "USE $mysql_name; Update $table_name set date='$date' where name='$name';";
    then
        echo "Updated successfully!!!..."
    else
        echo "Failed to update"
    fi
}

delete_data(){
    name=$1
    date=$2
    if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Delete from  $table_name where name='$name' and date='$date';";
    then
        echo "Deleted successfully!!!..."
    else
        echo "Failed to delete"
    fi
}




# CRUD CReate , Read , UPdate , Delete 

# mysql -u $mysql_user -p$mysql_passwd -D $mysql_name -se "Select name from events;"

# establish_connection
# insert_data 'Raman Kumar' '2003-01-01'
# update_data "Raman Kumar" "2003-01-02"
# delete_data "" '0000-00-00'
# getdata_from_db
# getdata_in_file

# cat calendar_events.txt
