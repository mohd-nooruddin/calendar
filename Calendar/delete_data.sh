#!/usr/bin/bash

source establish_connection.sh
source find_events.sh

delete_data_by_name_category(){

        read -p "Enter Category : " category1
        read -p "Enter Person/Meeting Name : " updatedperson1
        echo "Checking Your Data...."
        check_data_by_category_person "$updatedperson1" "$category1"
        if [[ $retreived_id1 == "" ]];
         then
              echo "Data (Event) Not Found with category ($category1) and Name ($updatedperson1)"
         else
            #    read -p "Enter Date to be Updated : " updateddate1
            #    if [[ ! $updateddate1 =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
            #    then
            #         echo "Invalid Date Format :  $updateddate1 "
            #    else
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
                      if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Delete from $table_name1 where $full_name_column1='$updatedperson1' and $column_event_name1='$column_name_data1';";
                       then
                            echo "Data Deleted where name ($updatedperson1) and category ($category1)"
                       else 
                            echo "Data Not found.... "
                       fi
                # fi
         fi
}

delete_data_by_date_category(){

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
            #    read -p "Enter Update Person/Meeting name : " updatedname2
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
               if mysql -u $mysql_user -p$mysql_passwd -h $mysql_hostname -P"$port_num" -e "USE $mysql_name; Delete from  $table_name2 where $column_name2='$updatedate2' and $column_event_name='$column_name_data2';";
                then
                     echo "Data Deleted where date ($updatedate2) and category ($category2)"
                else 
                     echo "Data Not found.... "
                fi
         fi
    fi
}
