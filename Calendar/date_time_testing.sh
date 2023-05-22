#!/usr/bin/bash

# isValidDate() {
#     local d="$1"
#     date "+%Y-%m-%d" -d "$d" > /dev/null  2>&1
#     if [ $? != 0 ]
#     then
#         echo "Date $d NOT a valid YYYY-MM-DD date"
#         # exit 1
#         # break
#     fi
# }


# isVAlidDateReguix(){
#     local d="$1"
#     if [[ ! $d =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]];
#     then 
#          echo "DAte is valid "$d
#     else
#           echo "Invalid date "$d
#     fi
# }
# isVAlidTimeReguix(){
#     local d="$1"
#     if [[  $d =~ ^[0-9]{2}:[0-9]{2}$ ]];
#     then 
#          echo "DAte is valid "$d
#     else
#           echo "Invalid date "$d
#     fi
# }

# isVAlidDateReguix "2004s-01-02"
# isVAlidTimeReguix "11:30"

                        #  select eventname1 in 'Birthday' 'Meetings' 'Other' 'Back'
                        #     do
                        #        case $eventname1 in 
                        #            'Birthday' )
                        #                         read -p "Enter Person Name : " birthdaypersoname1
                        #                         read -p "Enter Date of Event (YYYY-MM-DD): " birthdaydate1
                        #                         local d="$birthdaydate1"
                        #                         date "+%Y-%m-%d" -d "$d" > /dev/null  2>&1
                        #                         if [ $? != 0 ]
                        #                         then
                        #                             echo "Date $d NOT a valid YYYY-MM-DD date"
                        #                             # exit 1
                        #                             break
                        #                         fi
                        #                         # isValidDate $ birthdaydate1
                        #                         check_data_by_name_date_eventname "$birthdaypersoname1" "$birthdaydate1" "$eventname1"
                        #                         if [[ $retreived_id != "" ]];
                        #                         then
                        #                              echo "User $retreived_id found "
                        #                         else
                        #                              insert_data "$birthdaypersoname1" "$eventname1" "$birthdaydate1"
                        #                              break
                        #                         fi
                        #                         ;;
                        #              'Meetings' )
                        #                          read -p "Enter Meeting Name : " meetingname1
                        #                          read -p "Enter Date of Meeting Date (YYYY-MM-DD): " meetingdate1
                        #                          local d="$meetingdate1"
                        #                          date "+%Y-%m-%d" -d "$d" > /dev/null  2>&1
                        #                          if [ $? != 0 ]
                        #                          then
                        #                              echo "Date $d NOT a valid YYYY-MM-DD date"
                        #                              # exit 1
                        #                              break
                        #                          fi
                        #                          read -p "Start of Meeting (HH:MM 24Hrs): " startmeeting1
                        #                          if [[ ! $startmeeting1 =~ ^[0-9]{2}:[0-9]{2}$ ]];
                        #                          then
                        #                                 echo "Invalid End Time : " $startmeeting1
                        #                          else
                        #                                read -p "End time of meeting (HH:MM 24Hrs): " endmeeting1
                        #                                if [[ ! $endmeeting1 =~ ^[0-9]{2}:[0-9]{2}$ ]];
                        #                                then
                        #                                      echo "Invalid Start Time : " $startmeeting1
                        #                                else
                        #                                       insert_data_in_meetings "$meetingname1" "$meetingdate1" "$startmeeting1" "$endmeeting1"
                        #                                break
                        #                                fi
                        #                          fi
                        #                          ;;
                        #                 'Other' ) 
                        #                          #  THis will go inplace of birthday 
                        #                           read -p "Enter the Event name : " othereventname2
                        #                          #  THis will go inplace of fullname
                        #                           read -p "For Whoom It is ? : " eventorganiser1
                        #                           read -p "Enter Date of Event (YYYY-MM-DD): " eventdate2
                        #                           local d="$eventdate2"
                        #                               date "+%Y-%m-%d" -d "$d" > /dev/null  2>&1
                        #                               if [ $? != 0 ]
                        #                               then
                        #                                   echo "Date $d NOT a valid YYYY-MM-DD date"
                        #                                   # exit 1
                        #                                   break
                        #                               fi
                        #                           check_data_by_name_date_eventname "$eventorganiser1" "$othereventname2" "$eventdate2"
                        #                              if [[ $retreived_id != "" ]];
                        #                              then
                        #                                   echo "User $retreived_id found "
                        #                              else
                        #                                   insert_data_for_others "$eventorganiser1" "$othereventname2" "$eventdate2"
                        #                                   break
                        #                              fi
                        #                          ;;
                        #                  'Back' ) 
                        #                       echo "Redirecting..."
                        #                       break
                        #                       ;;
                        #                  * ) 
                        #                     #   THis will go inplace of Birthday 
                        #                      read -p "Enter the name of Event : " eventname22
                        #                     #  THis will go inplce of full name in the table 
                        #                      read -p "For Whoom it is ? : " eventorganiser2
                        #                      read -p "Enter Date of Event : " eventdate22
                        #                      local d="$eventdate22"
                        #                          date "+%Y-%m-%d" -d "$d" > /dev/null  2>&1
                        #                          if [ $? != 0 ]
                        #                          then
                        #                              echo "Date $d NOT a valid YYYY-MM-DD date"
                        #                              # exit 1
                        #                              break
                        #                          fi

                        #                       check_data_by_name_date_eventname "$eventorganiser2" "$eventname22" "$eventdate22"
                        #                         if [[ $retreived_id != "" ]];
                        #                         then
                        #                              echo "User $retreived_id found "
                        #                         else
                        #                              insert_data_for_others "$eventorganiser2" "$eventname22" "$eventdate22"
                        #                              break
                        #                         fi
                        #                      ;;
                        #          esac 
                        #     done


# cat "loadingScreen.txt"
