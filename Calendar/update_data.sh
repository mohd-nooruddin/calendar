#!/usr/bin/bash

# echo "Hello "
source establish_connection.sh
source find_events.sh


Update_data_by_category_person(){

     local selection_name="$1"
     # local tablename1="$2"

     if [[ $selection_name == "birthday" ]]
     then
          read -p "Enter Person Name : " person_name1
          echo "Fetching Your Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Update events set where full_name='$person_name1' and event_name='Birthday';";
          then
               echo "Above All are the matches of Person Name ($person_name1)"
          else 
               echo "Data Not found.... "
          fi
     elif [[ $selection_name == "other" ]]
     then
          read -p "Enter Person Name : " person_name2
          echo "Fetching Your Request...."
          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Select full_name as 'For Whoom',event_name as 'Event Name', event_date as 'Event Date' from events where full_name='$person_name2' and other_events='Other';";
          then
               echo "Above All are the Matches of Person Name ($person_name2)"
          else 
               echo "Data Not found.... "
          fi
     elif [[ $selection_name == "meeting" ]]
     then 
           read -p "Enter Meeting Name : " meeting_name3
           echo "Fetching Your Request...."
           if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Select m_name as 'Meeting Name',event_name as 'Event Name', m_date as 'Meeting Date',start_time as 'Start Time', end_time as 'End Time' from meeting_events where m_name='$meeting_name3';"
          then
               echo "Above All are the matches of Meeting Name ($meeting_name3)"
          else 
               echo "Data Not found.... "
          fi
     else
         echo "Invalid Choice Please Select from Meeting, Birthday or Other "
     fi
}


Update_data_by_date_category(){
    read -p "Enter Category : " category2
    read -p "Enter Date (YYYY-MM-DD) : " updatedate2
    if [[ ! $updatedate2 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
    then
         echo "Invalid Date Format : "$updatedate2
    else
         echo "Checking Your Data...."
        check_data_by_category_date "$updatedate2" "$category2"
        if [[ $retreived_id2 == "" ]];
         then
              echo "Data(Event) Not Found with category ($category2) and date ($updatedate2)"
         else
               read -p "Enter Update Person/Meeting name : " updatedname2
               local column_name2="event_date"
                local event_name2=""
                local table_name2="events"
                local column_event_name="event_name"
                local column_name_data2="Birthday"
                local full_name_column2="full_name"
                event_name2="$(echo $category2 | awk '{print tolower($0)}')"
#                    echo $event_name2
                if [[ "$event_name2" == "meeting" ]];
                then
                     column_name2="m_date"
                     full_name_column2="m_name"
                     table_name2="meeting_events"
                     column_name_data2="Meeting"
                 elif [[ "$event_name2" == "other" ]]
                 then
                      column_event_name="other_events"
                      column_name_data2="Other"
                 fi
               if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Update $table_name2 set $full_name_column2='$updatedname2' where $column_name2='$updatedate2' and $column_event_name='$column_name_data2';";
                then
                     echo "Name ($updatedname2) Updated where date ($updatedate2) and category ($category2)"
                else 
                     echo "Data Not found.... "
                fi
         fi
    fi
}

Update_data_by_Person_category(){
    read -p "Enter Category : " category1
    read -p "Enter Person/Meeting Name : " updatedperson1
        echo "Checking Your Data...."
        check_data_by_category_person "$updatedperson1" "$category1"
        if [[ $retreived_id1 == "" ]];
         then
              echo "Data (Event) Not Found with category ($category1) and Name ($updatedperson1)"
         else
               read -p "Enter Date to be Updated : " updateddate1
               if [[ ! $updateddate1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
               then
                    echo "Invalid Date Format :  $updateddate1 "
               else
                    local column_name1="event_date"
                     local event_name1=""
                     local table_name1="events"
                     local column_event_name1="event_name"
                     local column_name_data1="Birthday"
                     local full_name_column1="full_name"
                     event_name1="$(echo $category1 | awk '{print tolower($0)}')"
#                    echo $event_name2
                     if [[ "$event_name1" == "meeting" ]];
                     then
                          column_name1="m_date"
                          full_name_column1="m_name"
                          table_name1="meeting_events"
                          column_name_data1="Meeting"
                      elif [[ "$event_name1" == "other" ]]
                      then
                           column_event_name1="other_events"
                           column_name_data1="Other"
                      fi
                      if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Update $table_name1 set $column_name1='$updateddate1' where $full_name_column1='$updatedperson1' and $column_event_name1='$column_name_data1';";
                       then
                            echo "Date ($updateddate1) Updated where name ($updatedperson1) and category ($category1)"
                       else 
                            echo "Data Not found.... "
                       fi
                fi
         fi
}


Update_all_data_of_Person_category(){
    read -p "Enter Category : " category1
    read -p "Enter Person/Meeting Name : " updatedperson1
        echo "Checking Your Data...."
        check_data_by_category_person "$updatedperson1" "$category1"
        if [[ $retreived_id1 == "" ]];
         then
              echo "Data (Event) Not Found with category ($category1) and Name ($updatedperson1)"
         else
               read -p "Enter Date to be Updated : " updateddate1
               if [[ ! $updateddate1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
               then
                    echo "Invalid Date Format :  $updateddate1 "
               else
                    local column_name1="event_date"
                     local event_name1=""
                     local table_name1="events"
                     local column_event_name1="event_name"
                     local column_name_data1="Birthday"
                     local full_name_column1="full_name"
                     event_name1="$(echo $category1 | awk '{print tolower($0)}')"
#                    echo $event_name2
                     if [[ "$event_name1" == "meeting" ]];
                     then
                          column_name1="m_date"
                          full_name_column1="m_name"
                          table_name1="meeting_events"
                          column_name_data1="Meeting"
                          if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Update $table_name1 set $column_name1='$updateddate1' where $full_name_column1='$updatedperson1' and $column_event_name1='$column_name_data1';";
                          then
                               echo "Date ($updateddate1) Updated where name ($updatedperson1) and category ($category1)"
                          else 
                               echo "Data Not found.... "
                          fi
                      elif [[ "$event_name1" == "other" ]]
                      then
                           column_event_name1="other_events"
                           column_name_data1="Other"
                      fi
                      if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Update $table_name1 set $column_name1='$updateddate1' where $full_name_column1='$updatedperson1' and $column_event_name1='$column_name_data1';";
                       then
                            echo "Date ($updateddate1) Updated where name ($updatedperson1) and category ($category1)"
                       else 
                            echo "Data Not found.... "
                       fi
                fi
         fi
}

# Update_data_by_date_category 
# Update_data_by_Person_category