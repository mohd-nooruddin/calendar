#!/usr/bin/bash

source establish_connection.sh

sent_all_data_into_mail(){
    mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_name='$2' and m_date='$3' order by m_date;" > meeting_schedule.txt
    echo "Sending mail to $1 ......"
    mutt -s "$2 Scheduled" $1 < /home/noor/Documents/Calendar/meeting_schedule.txt 2>/dev/null
    echo "Mail Sent"
}
