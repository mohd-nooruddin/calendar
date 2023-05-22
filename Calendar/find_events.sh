#!/usr/bin/bash

#Establishing Connection from database from this file 
source establish_connection.sh


# Declaring the variables 
table_name="events"


# # Here I'm establishing the connection with database by the below command 
# establish_connection(){
#     mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -e "USE "$mysql_name";"
# }

# Finding data by it's name and event date 
check_data_by_name_date(){
    # First input should be name and second should be date 
    retreived_id=""
    retreived_id=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -P"$port_num" -e "USE "$mysql_name"; Select id from $table_name where full_name='$1' and event_date='$2'");
    # retreived_id=$(echo -ne $retreived_id)
    if [[ $retreived_id != "" ]];
    then
         echo "User $retreived_id found "
    else
         echo "User $retreived_id not found "      
    fi
}

check_data_by_category_person(){
    # First input should be Full name and second category(event_name)
    column_name1="full_name"
    local event_name1=""
    local table_name1="events"
    local column_event_name1="event_name"
    local column_name_data1="Birthday"
    event_name1="$(echo $2 | awk '{print tolower($0)}')"
#     echo $event_name1
    if [[ "$event_name1" == "meeting" ]];
    then
         column_name1="m_name"
         table_name1="meeting_events"
         column_name_data1="Meeting"
     elif [[ "$event_name1" == "other" ]]
     then
          column_event_name1="other_events"
          column_name_data1="Other"
     fi
     # echo "$table_name1"
    retreived_id1=""
    retreived_id1=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -P"$port_num" -e "USE "$mysql_name"; Select id from $table_name1 where $column_name1='$1' and $column_event_name1='$column_name_data1'");
    # retreived_id=$(echo -ne $retreived_id)
#     if [[ $retreived_id1 != "" ]];
#     then
#          echo "User $retreived_id1 found "
#     else
#           echo "$retreived_id1"
#          echo "User not found "      

#     fi
}

# check_data_by_category_person "adfg" "OTHER"

check_data_by_category_date(){
    # First input should be table name, second should be Full name and category(event_name)
    column_name2="event_date"
    local event_name2=""
    local table_name2="events"
    local column_event_name="event_name"
    local column_name_data2="Birthday"
    event_name2="$(echo $2 | awk '{print tolower($0)}')"
#     echo $event_name2
    if [[ "$event_name2" == "meeting" ]];
    then
         column_name2="m_date"
         table_name2="meeting_events"
         column_name_data2="Meeting"
     elif [[ "$event_name2" == "other" ]]
     then
          column_event_name="other_events"
          column_name_data2="Other"
     fi
     # echo "$table_name2"
    retreived_id2=""
    retreived_id2=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -P"$port_num" -e "USE "$mysql_name"; Select id from $table_name2 where $column_name2='$1' and $column_event_name='$column_name_data2'");
    # retreived_id=$(echo -ne $retreived_id)
#     if [[ $retreived_id2 != "" ]];
#     then
#          echo "User $retreived_id2 found "
#     else
#           echo "$retreived_id2"
#          echo "User not found "      

#     fi
}

# check_data_by_category_date "2004-01-01" "OtHer"

search_events_by_days(){
    # First input should be from date and second should be to 
    read -p "Enter Start Date (YYYY-MM-DD): " start_date1
    if [[ ! $start_date1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
    then
          echo "Invalid Start Date : $start_date1"
     else
          read -p "Enter End Date (YYYY-MM-DD): " end_date1
          if [[ ! $end_date1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
          then
                echo "Invalid End Date : $end_date1"
          else
                count=""
                # count=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -e "USE $mysql_name; Select count(*) from $table_name where event_date between '$1' and '$2';")
                echo "Fetching Your request...."
                count=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -P"$port_num" -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_date between '$start_date1' and '$end_date1'; Select * from meeting_events where m_date between '$start_date1' and '$end_date1'");
                # count=$( echo -ne "$count" )
                if [[ $count == "" ]];
                then
                     echo "No Upcoming events From '$start_date1' To '$end_date1'"
                else
                     mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -P"$port_num" -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_date between '$start_date1' and '$end_date1' and event_name='Birthday'; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where event_date between '$start_date1' and '$end_date1' and other_events='Other'; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_date between '$start_date1' and '$end_date1';"
                fi
          fi
    fi
}

retreived_id=""
# Finding data by it's name and event date 
check_data_by_name_date_eventname(){
    # First input should be name and second should be date 
    
    retreived_id=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -e "USE "$mysql_name"; Select id from $table_name where full_name='$1' and event_date='$2' and event_name='$3'");
    # retreived_id=$(echo -ne $retreived_id)
#     if [[ $retreived_id != "" ]];
#     then
#          echo "User $retreived_id found "
#     else
#          echo "User $retreived_id not found "      
#     fi
}
# establish_connection
# search_events_by_days '2003-11-15' '2005-08-10'
# result=""
# result=$(check_data_by_name_date 'Harsh Tripathi' '2004-11-18')
# echo "$result"
# getdata_in_file(){
#     if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events;" > calendar_events.txt;
#     then
#         echo "Reterieved succesfully... "
#     else
#         echo "Failed to retrieve data"
#     fi
find_data_by_event_name(){
     local selection_name="$1"
     # local tablename1="$2"
     if [[ $selection_name == "birthday" ]]
     then
          echo "Fetching Your Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_name='Birthday';";
          then
               echo "Above All have Event Name Birthday"
          else 
               echo "Data Not found.... "
          fi
     elif [[ $selection_name == "other" ]]
     then
          echo "Fetching Your Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where other_events='Other';";
          then
               echo "Above All have event name Other"
          else 
               echo "Data Not found.... "
          fi
     elif [[ $selection_name == "meeting" ]]
     then
           echo "Fetching Your Request...."
           if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where event_name='Meeting';"
          then
               echo "Above All have Event name Meeting"
          else 
               echo "Data Not found.... "
          fi
     else
         echo "Invalid Choice Please Select from Meeting, Birthday or Other "
     fi
}
find_data_by_person_name(){
     local selection_name="$1"
     # local tablename1="$2"
     if [[ $selection_name == "birthday" ]]
     then
          read -p "Enter Person Name : " person_name1
          echo "Fetching Your Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where full_name='$person_name1' and event_name='Birthday';";
          then
               echo "Above All are the matches of Person Name ($person_name1)"
          else 
               echo "Data Not found.... "
          fi
     elif [[ $selection_name == "other" ]]
     then
          read -p "Enter Person Name : " person_name2
          echo "Fetching Your Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where full_name='$person_name2' and other_events='Other';";
          then
               echo "Above All are the Matches of Person Name ($person_name2)"
          else 
               echo "Data Not found.... "
          fi
     elif [[ $selection_name == "meeting" ]]
     then 
           read -p "Enter Meeting Name : " meeting_name3
           echo "Fetching Your Request...."
           if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_name='$meeting_name3';"
          then
               echo "Above All are the matches of Meeting Name ($meeting_name3)"
          else 
               echo "Data Not found.... "
          fi
     else
         echo "Invalid Choice Please Select from Meeting, Birthday or Other "
     fi
}


find_all_data_by_date(){
     local selection_name="$1"
     # local tablename1="$2"
     if [[ $selection_name == "birthday" ]]
     then
          read -p "Enter Event date (YYYY-MM-DD) : " event_date1
          if [[ ! $event_date1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
          then
                echo "Invalid Date $event_date1"
          else
                echo "Fetching Your Request...."
                if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_date='$event_date1' and event_name='Birthday';";
                then
                     echo "Above All are the matches of Event date ($event_date1)"
                else 
                     echo "Data Not found.... "
                fi
          fi
     elif [[ $selection_name == "other" ]]
     then
          read -p "Enter Event Date (YYYY-MM-DD) : " event_date2
          if [[ ! $event_date2 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
          then
                echo "Invalid Date $event_date1"
          else
                echo "Fetching Your Request...."
                if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where event_date='$event_date2' and other_events='Other';";
                then
                     echo "Above All are the Matches of Event date ($event_date2)"
                else 
                     echo "Data Not found.... "
                fi
          fi
     elif [[ $selection_name == "meeting" ]]
     then 
           read -p "Enter Meeting Date (YYYY-MM-DD) : " meeting_date3
           if [[ ! $meeting_date3 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
           then
                echo "Invalid Date $meeting_date3"
           else
                echo "Fetching Your Request...."
                if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_date='$meeting_date3';"
                then
                    echo "Above All are the matches of Meeting date ($meeting_date3)"
                else 
                    echo "Data Not found.... "
                fi
           fi
     else
         echo "Invalid Choice Please Select from Meeting, Birthday or Other "
     fi
}

find_complete_data_by_date(){
     read -p "Enter Event Date : " event_meeting_date1
     if [[ ! $event_meeting_date1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
     then
          echo "Invalid Date : $event_meeting_date1"
     else
          echo "Fetching YOur Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_date='$event_meeting_date1' and event_name='Birthday'; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where event_date='$event_meeting_date1' and other_events='Other'; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_date='$event_meeting_date1';";
          then
                echo "Above are the matches of Data where date is : $event_meeting_date1"
          else
               "Data not found"
          fi

     fi
}


get_all_data_within_range(){
     start_date2="$1"
     end_date2="$2"
     count=""
                # count=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -e "USE $mysql_name; Select count(*) from $table_name where event_date between '$1' and '$2';")
                echo "Fetching Your request...."
                count=$(mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_date between '$start_date2' and '$end_date2'; Select * from meeting_events where m_date between '$start_date2' and '$end_date2'");
                # count=$( echo -ne "$count" )
                if [[ $count == "" ]];
                then
                     echo "No Upcoming events From '$start_date2' To '$end_date2'"
                else
                     mysql -u "$mysql_user" -p"$mysql_passwd" -h "$mysql_hostname" -e "USE $mysql_name; Select full_name as 'Full Name',event_name as 'Event Name', event_date as 'Event Date' from events where event_name='Birthday'; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where event_date between '$start_date2' and '$end_date2' and other_events='Other'; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_date between '$start_date2' and '$end_date2';"
                fi
}
# find_data_by_event_name "Meeting"
# find_complete_data_by_date
# find_all_data_by_date "other"
# check_data_by_category_date