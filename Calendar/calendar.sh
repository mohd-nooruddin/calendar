#!/usr/bin/bash

echo "Checking Internet......"
source source_file.sh
echo "Establishing Connection with database..."
database_work
echo "Hello"
# sleep 50s
calendar_connection() {

    condition=True

    while
        [ $condition ]
        clear
    do
        clear
        echo
        echo
        echo

        echo "                                        ██████ "
        echo "                                       ██      "
        echo "                                       ██      "
        echo "                                       ██      "
        echo "                                        ██████ "
        echo "                                               "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  "
        echo "                                       ██      ██   ██ "
        echo "                                       ██      ███████ "
        echo "                                       ██      ██   ██ "
        echo "                                        ██████ ██   ██ "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  ██      "
        echo "                                       ██      ██   ██ ██      "
        echo "                                       ██      ███████ ██      "
        echo "                                       ██      ██   ██ ██      "
        echo "                                        ██████ ██   ██ ███████ "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  ██      ███████ "
        echo "                                       ██      ██   ██ ██      ██      "
        echo "                                       ██      ███████ ██      █████   "
        echo "                                       ██      ██   ██ ██      ██      "
        echo "                                        ██████ ██   ██ ███████ ███████ "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  ██      ███████ ███    ██ "
        echo "                                       ██      ██   ██ ██      ██      ████   ██ "
        echo "                                       ██      ███████ ██      █████   ██ ██  ██ "
        echo "                                       ██      ██   ██ ██      ██      ██  ██ ██ "
        echo "                                        ██████ ██   ██ ███████ ███████ ██   ████ "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  ██      ███████ ███    ██ ██████  "
        echo "                                       ██      ██   ██ ██      ██      ████   ██ ██   ██ "
        echo "                                       ██      ███████ ██      █████   ██ ██  ██ ██   ██ "
        echo "                                       ██      ██   ██ ██      ██      ██  ██ ██ ██   ██ "
        echo "                                        ██████ ██   ██ ███████ ███████ ██   ████ ██████  "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  ██      ███████ ███    ██ ██████   █████  "
        echo "                                       ██      ██   ██ ██      ██      ████   ██ ██   ██ ██   ██ "
        echo "                                       ██      ███████ ██      █████   ██ ██  ██ ██   ██ ███████ "
        echo "                                       ██      ██   ██ ██      ██      ██  ██ ██ ██   ██ ██   ██ "
        echo "                                        ██████ ██   ██ ███████ ███████ ██   ████ ██████  ██   ██ "
        sleep 0.5
        clear
        echo
        echo
        echo
        echo "                                        ██████  █████  ██      ███████ ███    ██ ██████   █████  ██████  "
        echo "                                       ██      ██   ██ ██      ██      ████   ██ ██   ██ ██   ██ ██   ██ "
        echo "                                       ██      ███████ ██      █████   ██ ██  ██ ██   ██ ███████ ██████  "
        echo "                                       ██      ██   ██ ██      ██      ██  ██ ██ ██   ██ ██   ██ ██   ██ "
        echo "                                        ██████ ██   ██ ███████ ███████ ██   ████ ██████  ██   ██ ██   ██ "

        echo
        echo
        echo
        current_time_date="$(date +'%r, %A, %B %d, %Y')"
        echo "         $current_time_date"
        echo "|-----------------------------------------------------------|"
        echo "                        User manual     "
        echo "|-----------------------------------------------------------|"
        echo "1. Calendar"
        echo "2. Events"
        echo "3. Holidays"
        echo "4. Calendar, Holidays and Events"
        echo "5. Exit"
        echo "------------------------------------------------------------"
        read choice
        # select choice in 'Show calendar' 'Show Events' 'Show Holidays' 'Calendar Holidays and Events together' 'Exit'
        # do
        case $choice in
        1)
            echo "|---------------------------------------------------------|"
            only_with_calendar_cmd
            while [ $condition ]; do
                echo "|---------------------------------------------------------|"
                echo "1. Current Year"
                echo "2. Complete Year's"
                echo "3. Month and Year wise"
                echo "4. Month wise calendar of Current Year"
                echo "5. Julian Calendar"
                echo "6. Previous Menu (Back)"
                echo "7. Exit"
                read choice2
                case $choice2 in
                1)
                    current_year_by_view "-y"
                    ;;
                2)
                    read -p "Enter the Year Whoose Calendar you want. " inputvalue1

                    year=$inputvalue1
                    if [[ ! $year =~ ^[0-9]+$ ]]; then
                        echo "Error: Year ($year ) must be an Integer"
                    else
                        if [ $year -lt 1000 ] || [ $year -gt 9999 ]; then
                            echo "Error: Year ($year) must be in a range of 1000 to 9999"
                        else
                            year_vise_view $inputvalue1
                        fi

                    fi
                    ;;
                3)
                    read -p "Enter the Month in numeric : " inputvalue2
                    month=$inputvalue2
                    #Checking whether a month or year are integer or not
                    if [[ ! $month =~ ^[0-9]+$ ]]; then
                        echo "Error: Month ($month) must be an integer"
                        echo "Please Check your input"
                    else
                        #Checking whether given month is in range or not
                        if [ $month -lt 1 ] || [ $month -gt 12 ]; then
                            echo "Error: Month ($month) must be between 1 and 12"
                        else
                            read -p "Enter the Year in numeric : " inputvalue3
                            year=$inputvalue3
                            if [[ ! $year =~ ^[0-9]+$ ]]; then
                                echo "Error: Year ($year) must be an integer"
                                echo "Please Check your input"
                            else
                                month_and_year_vise_view $inputvalue2 $inputvalue3
                            fi
                        fi
                    fi

                    ;;
                4)
                    read -p "Enter the Name of month (Ex: June) : " inputvalue4
                    month_name_vise_view "-m" $inputvalue4
                    echo
                    #  break
                    ;;
                5)
                    #   echo "Work In Progress....."
                    cal -j 2023
                    #  break
                    ;;
                6)
                    echo "Redirecting..."
                    break
                    ;;
                7)
                    read -p "Do you Really wanna Exit (Y/N) :" check1
                    if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]]; then
                        exit 0
                        #   else
                        #         break
                    fi
                    ;;
                *)
                    echo "Invalid choice ($choice2)."
                    echo "Please wait for (2 Seconds) and Try Again!!!..."
                    sleep 1.1s
                    ;;
                esac
            done
            ;;
        2)
            #   echo "Checking Internet......"
            #   database_work
            while [ $condition ]; do
                echo "---------------------------------------------------------|"
                echo "1. Add Events"
                echo "2. View All events"
                echo "3. Update Event"
                echo "4. Delete Event"
                echo "5. Find Events"
                echo "6. Previous Menu (Back)"
                echo "7. Exit"
                read choice2
                case $choice2 in
                1)
                    select eventname1 in 'Birthday' 'Meetings' 'Other' 'Back'; do
                        case $eventname1 in
                        'Birthday')
                            read -p "Enter Person Name : " birthdaypersoname1
                            read -p "Enter Date of Event (YYYY-MM-DD): " birthdaydate1
                            local d="$birthdaydate1"
                            date "+%Y-%m-%d" -d "$d" >/dev/null 2>&1
                            if [ $? != 0 ]; then
                                echo "Date $d NOT a valid YYYY-MM-DD date"
                                # exit 1
                                break
                            fi
                            # isValidDate $ birthdaydate1
                            check_data_by_name_date_eventname "$birthdaypersoname1" "$birthdaydate1" "$eventname1"
                            if [[ $retreived_id != "" ]]; then
                                echo "User $retreived_id found "
                            else
                                insert_data "$birthdaypersoname1" "$eventname1" "$birthdaydate1"
                                break
                            fi
                            ;;
                        'Meetings')
                            read -p "Enter Meeting Name : " meetingname1
                            read -p "Enter Date of Meeting Date (YYYY-MM-DD): " meetingdate1
                            local d="$meetingdate1"
                            date "+%Y-%m-%d" -d "$d" >/dev/null 2>&1
                            if [ $? != 0 ]; then
                                echo "Date $d NOT a valid YYYY-MM-DD date"

                                break
                            fi
                            read -p "Start of Meeting (HH:MM 24Hrs): " startmeeting1
                            if [[ ! $startmeeting1 =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
                                echo "Invalid End Time : " $startmeeting1
                            else
                                read -p "End time of meeting (HH:MM 24Hrs): " endmeeting1
                                if [[ ! $endmeeting1 =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
                                    echo "Invalid Start Time : " $startmeeting1
                                else
                                    insert_data_in_meetings "$meetingname1" "$meetingdate1" "$startmeeting1" "$endmeeting1"
                                    echo "Do You want this on mail (Y/N)"
                                    read choice15
                                    if [[ $choice15 == "Y" ]] || [[ $choice15 == "y" ]]; then
                                        read -p "Enter Your Email Address : " email_address1
                                        sent_all_data_into_mail "$email_address1" "$meetingname1" "$meetingdate1"
                                    fi
                                    break
                                fi
                            fi
                            ;;
                        'Other')
                            #  THis will go inplace of birthday
                            read -p "Enter the Event name : " othereventname2
                            #  THis will go inplace of fullname
                            read -p "For Whoom It is ? : " eventorganiser1
                            read -p "Enter Date of Event (YYYY-MM-DD): " eventdate2
                            local d="$eventdate2"
                            date "+%Y-%m-%d" -d "$d" >/dev/null 2>&1
                            if [ $? != 0 ]; then
                                echo "Date $d NOT a valid YYYY-MM-DD date"
                                # exit 1
                                break
                            fi
                            check_data_by_name_date_eventname "$eventorganiser1" "$othereventname2" "$eventdate2"
                            if [[ $retreived_id != "" ]]; then
                                echo "User $retreived_id found "
                            else
                                insert_data_for_others "$eventorganiser1" "$othereventname2" "$eventdate2"
                                break
                            fi
                            ;;
                        'Back')
                            echo "Redirecting..."
                            break
                            ;;
                        *)
                            #   THis will go inplace of Birthday
                            read -p "Enter the name of Event : " eventname22
                            #  THis will go inplce of full name in the table
                            read -p "For Whoom it is ? : " eventorganiser2
                            read -p "Enter Date of Event : " eventdate22
                            local d="$eventdate22"
                            date "+%Y-%m-%d" -d "$d" >/dev/null 2>&1
                            if [ $? != 0 ]; then
                                echo "Date $d NOT a valid YYYY-MM-DD date"
                                # exit 1
                                break
                            fi

                            check_data_by_name_date_eventname "$eventorganiser2" "$eventname22" "$eventdate22"
                            if [[ $retreived_id != "" ]]; then
                                echo "User $retreived_id found "
                            else
                                insert_data_for_others "$eventorganiser2" "$eventname22" "$eventdate22"
                                break
                            fi
                            ;;
                        esac
                    done
                    ;;
                2)
                    get_all_data
                    ;;
                3)
                    while [[ $condition ]]; do
                        echo "1. Update Date By Event Category & Person Name : "
                        echo "2. Update Person Name By Event Category & Event Date : "
                        echo "3. Update Event by Date : "
                        echo "4. Update Meetings : "
                        echo "6. Previous Menu (Back) : "
                        echo "7. Exit : "
                        read choice3

                        case $choice3 in
                        1)
                            Update_data_by_Person_category
                            ;;
                        2)
                            Update_data_by_date_category
                            ;;
                        3)
                            echo "Work in progress"
                            ;;
                        4)
                            echo "Work in progress"
                            ;;
                            #   5 )
                            #         echo "Work in progress"
                            #        ;;
                        6)
                            echo "Redirecting..."
                            break
                            ;;
                        7)
                            read -p "Do you Really wanna Exit (Y/N) :" check1
                            if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]]; then
                                echo "Thankyou For using my application"
                                echo "Come Soon :)"
                                exit 0
                                #   else
                                #         break
                            fi
                            ;;
                        *)
                            echo "Invalid choice ($choice2)."
                            echo "Please wait for (2 Seconds) and Try Again!!!..."
                            sleep 1.1s
                            ;;
                        esac

                    done
                    ;;
                4)
                    while [[ $condition ]]; do
                        echo "1. Delete By Event Category & Person/Meeting Name : "
                        echo "2. Delete By Event Category & Event Date : "
                        #   echo "3. Find Event by Date : "
                        #   echo "4. Find all meetings : "
                        #   echo "5. Find All Events In a specific range : "
                        echo "6. Previous Menu (Back) : "
                        echo "7. Exit : "
                        read choice3

                        case $choice3 in
                        1)
                            delete_data_by_name_category
                            ;;
                        2)
                            delete_data_by_date_category
                            ;;
                            #   3 )
                            #        echo ""
                            #        ;;
                            #   4 )
                            #        echo ""
                            #        ;;
                            #   5 )
                            #        echo ""
                            #        ;;
                        6)
                            echo "Redirecting..."
                            break
                            ;;
                        7)
                            read -p "Do you Really wanna Exit (Y/N) :" check1
                            if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]]; then
                                echo "Thankyou For using my application"
                                echo "Come Soon :)"
                                exit 0
                                #   else
                                #         break
                            fi
                            ;;
                        *)
                            echo "Invalid choice ($choice2)."
                            echo "Please wait for (2 Seconds) and Try Again!!!..."
                            sleep 1.1s
                            ;;
                        esac

                    done
                    ;;
                5)
                    while [[ $condition ]]; do
                        echo "---------------------------------------------"
                        echo "1. Find By Event Name : "
                        echo "2. Find By Person name and Category : "
                        echo "3. Find Event by Date and Category : "
                        echo "4. Find all meetings,birthdays and others by date : "
                        echo "5. Find All Events In a specific Date range : "
                        echo "6. Previous Menu (Back) : "
                        echo "7. Exit : "
                        read choice3

                        case $choice3 in
                        1)
                            read -p "Enter Event's Category : " event_name51
                            event_name51=$(echo "$event_name51" | awk '{print tolower($0)}')
                            find_data_by_event_name "$event_name51"
                            ;;
                        2)
                            #    echo "Id condition isn't true then do that "
                            read -p "Enter Event's Category : " event_name52
                            event_name52=$(echo "$event_name52" | awk '{print tolower($0)}')
                            find_data_by_person_name "$event_name52"

                            ;;
                        3)
                            read -p "Enter Event's Category : " event_name53
                            event_name52=$(echo "$event_name53" | awk '{print tolower($0)}')
                            find_all_data_by_date "$event_name53"
                            ;;
                        4)
                            find_complete_data_by_date
                            ;;
                        5)
                            search_events_by_days
                            ;;
                        6)
                            echo "Redirecting..."
                            break
                            ;;
                        7)
                            read -p "Do you Really wanna Exit (Y/N) :" check1
                            if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]]; then
                                echo "Thankyou For using my application"
                                echo "Come Soon :)"
                                exit 0
                            fi
                            ;;
                        *)
                            echo "Invalid choice ($choice2)."
                            echo "Please wait for (2 Seconds) and Try Again!!!..."
                            sleep 1.1s
                            ;;
                        esac

                    done
                    ;;
                6)
                    echo "Previous Menu (BACK)"
                    break
                    ;;
                7)
                    read -p "Do you Really wanna Exit (Y/N) :" check1
                    if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]]; then
                        echo "Thankyou For using my application"
                        echo "Come Soon :)"
                        exit 0
                        #   else
                        #         break
                    fi
                    ;;
                *)
                    echo "Invalid choice ($choice2)."
                    echo "Please wait for (2 Seconds) and Try Again!!!..."
                    sleep 1.1s
                    ;;
                esac
            done
            ;;
        3)
            while [ $condition ]; do
                echo "---------------------------------------------------------|"
                echo "1. Month Vise Holiday"
                echo "2. Current Year's Holidays"
                echo "3. Any Specific Year's Holiday"
                echo "4. Month and year's Holidays "
                #   echo "5. Holiday Data into mail "
                echo "6. Previous Menu(Back)"
                echo "7. Exit"
                read choice2
                case $choice2 in
                1)
                    current_date31="$(date +'%Y')"
                    echo "$current_date31"
                    #   holiday_name_and_date "$current_date31"
                    # break
                    ;;
                2)
                    current_date32="$(date +'%Y')"
                    #   echo "$current_date31"
                    echo "Fetching Holidays....."
                    holiday_name_and_date "$current_date32"
                    ;;
                3)
                    read -p "Enter The Year : " specific_year33
                    if [[ ! $specific_year33 =~ ^[0-9]+$ ]]; then
                        echo "Error:Year ( $specific_year33 ) must be an integer"
                        sleep 1.1s
                        break
                    fi
                    # Chec[king the range of the year wheather is's a four digit value or not ]
                    if [ "$specific_year33" -lt 1000 ] || [ "$specific_year33" -gt 9999 ]; then
                        echo "Error: Year ($specific_year33) must be in a range of 1000 to 9999"
                        sleep 1.1s
                        break
                    fi
                    echo "Fetching Holidays....."
                    holiday_name_and_date "$specific_year33"
                    #  break
                    ;;
                4)
                    echo
                    #  break
                    ;;
                5)
                    echo
                    #  break
                    ;;
                6)
                    echo "Previous Menu (BACK)"
                    break
                    ;;
                7)
                    read -p "Do you Really wanna Exit (Y/N) : " check1
                    if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]]; then
                        echo "Thankyou For using my application"
                        echo "Come Soon :)"
                        exit 0
                        #   else
                        #         break
                    fi
                    ;;
                *)
                    echo "Invalid choice ($choice2)."
                    echo "Please wait for (2 Seconds) and Try Again!!!..."
                    sleep 1.1s
                    ;;
                esac
            done
            ;;
        4)
            current_year_by_view "-y"
            echo "Holidays For Year 2023"
            echo "------------------------------------------"
            holiday_name_and_date "2023"
            echo "All Events of 2023 "
            echo "-------------------------------------------"
            get_all_data_within_range "2023-01-01" "2023-12-31"
            read -p "Press Enter To Clear " smaple
            #   while [ $condition ];
            #   do
            #       echo "---------------------------------------------------------|"
            #       echo "1. Current Month"
            #       echo "2. Current Year"
            #       echo "3. Complete Year's"
            #       echo "4. Month and year wise"
            #       echo "5. Month name wise"
            #       echo "6. Julian Calendar"
            #       echo "7. Current Year"
            #       read choice2
            #       case $choice2 in
            #           1 )
            #               echo
            #              # break
            #              ;;
            #           2 )
            #               echo
            #              #  break
            #              ;;
            #           3 )
            #               echo
            #              #  break
            #              ;;
            #           4 )
            #               echo
            #              #  break
            #              ;;
            #           5 )
            #               echo
            #              #  break
            #              ;;
            #           6 )
            #               echo "Previous Menu (BACK)"
            #               break
            #              ;;
            #           7 )
            #                read -p  "Do you Really wanna Exit (Y/N) :" check1
            #                if [[ $check1 == "Y" ]] || [[ $check1 == "y" ]];
            #                then
            #                     echo "Thankyou For using my application"
            #                     echo "Come Soon :)"
            #                     exit 0
            #              #   else
            #              #         break
            #                fi
            #                ;;
            #           * )
            #               echo "Invalid choice ($choice2)."
            #               echo "Please wait for (2 Seconds) and Try Again!!!..."
            #               sleep 1.1s
            #               ;;
            #       esac
            #   done
            ;;
        5)
            echo "Thanks for using my application !!!..."
            echo "Visit Again :)"
            exit 0
            ;;
        *)
            echo "Invalid choice ($choice)."
            echo "Please wait for (2 Seconds) and Try Again!!!..."
            sleep 1.1s
            #  break ;;
            ;;
        esac
        #  done
    done
}

calendar_connection
