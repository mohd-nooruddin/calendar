#!/usr/bin/bash

source establish_connection.sh


get_all_data(){
    mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from $table_name where event_name='Birthday' order by  event_date; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from $table_name where other_events='Other' order by event_date; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events order by m_date;"
}
# get_other_data_from_db(){
#     mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from $table_name where other_events='Other';"
# }
# get_meeting_data_from_db(){
#     mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events;"
# }

# get_all_data(){
#     get_birthday_data_db
#     get_other_data_from_db
#     get_meeting_data_from_db
# }

# getdata_in_file(){
#     if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events;" > calendar_events.txt;
#     then
#         echo "Reterieved succesfully... "
#     else
#         echo "Failed to retrieve data"
#     fi
# }