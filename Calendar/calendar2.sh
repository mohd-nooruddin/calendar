#!/usr/bin/bash

source holidays_api.sh
#Will have to provide first argument as month and second as year then only it will print the data
                # p=0
month_and_year_vise_view(){
#Checking whether argument provided are correct or not 
   if [ $# -ne  2 ]
   then 
     echo "Ooops!!!.. You have not entered correct month or year."
     echo "Try Again"
     exit 0
   fi
#Here I'm declaring 1st and second input to their respective month and years
   month=$1
   year=$2
                        #   holiday_name_and_date_specific "$year"
# #Checking whether a month is integer or not 
#    if [[ ! $month =~ ^[0-9]+$ ]];
#    then 
#      echo "Error: Month must be an integer"
#      exit 0
#    fi
# #Checking whether a year is integer or not 
#    if [[ ! $year =~ ^[0-9]+$ ]];
#    then 
#       echo "Error:Year ( $year ) must be an integer"
#       exit 0
#    fi
#    # Chec[king the range of the year wheather is's a four digit value or not ]
#    if [ $year -lt 1000 ] || [ $year -gt 9999 ];
#    then 
#        echo "Error: Year ($year) must be in a range of 1000 to 9999"
#        exit 0
#    fi
# #Checking whether given month is in range or not
#    if [ $month -lt 1 ] || [ $month -gt 12 ];
#    then 
#      echo "Error: Month ($month) must be between 1 and 12"
#      exit 0
#    fi

#Checking whether a month or year are integer or not 
if [[ ! $month =~ ^[0-9]+$ ]] || [[ ! $year =~ ^[0-9]+$ ]];
then 
  echo "Error: Month and Year must be an integer"
  echo "Please Check your input"
else 
      #Checking whether given month is in range or not
      if [ $month -lt 1 ] || [ $month -gt 12 ];
      then 
           echo "Error: Month ($month) must be between 1 and 12"
       else
            # Chec[king the range of the year wheather is's a four digit value or not ]
           if [ $year -lt 1000 ] || [ $year -gt 9999 ];
           then 
               echo "Error: Year ($year) must be in a range of 1000 to 9999"
           else
                #Total days per month in an year 
                days_in_months=(31 28 31 30 31 30 31 31 30 31 30 31)
                
                 #Cheacking whether given year is leap year or not 
                if [[ $((year%4)) -eq 0 ]];
                then 
                   if [[ $((year%100)) -eq 0 ]];
                   then
                      if [[ $((year%400)) -eq 0 ]];
                      then 
                         days_in_months[1]=29
                      fi
                   else
                       days_in_months[1]=29
                   fi
                fi
                #echo ${days_in_months[@]}
               
                #Finding first day of the month,last day and current date 
                start_day_month="$(date -d "$year-$month-01" +'%u')"
                # starts_day_month="$(date -d "$year-$month-01" +'%d')"
                month_name="$(date -d "$year-$month-01" +'%B')"
                current_date="$(date +'%F')"
                current_date_in_sec="$(date -d "$current_date" +'%s')"
             
                #current_month
                #echo $start_day_month
                #echo $current_date_in_sec
                                    #    holiday_name_and_date_specific "$year"
                echo ""
                echo "        " $month_name "$year"
                echo "Mon Tue Wed Thu Fri Sat Sun"
                #Increasing the spaces as per the date starts from which day
                for (( i=1; i<start_day_month; i++ ));
                 do 
                   echo -n "    "
                 done

                for (( day=1; day<=days_in_months[month-1]; day++ ))
                do 
                   #Finding date of calendar in seconds      
                   calendar_date_sec="$(date -d "$year-$month-$day" +'%s')"
                   #After Finding Just Comparing it with current date so that I can highlight current date
                   holiday_days_in_sec="$(date -d "${array_date[$p]}" +'%s')"
                   holiday_days_in_sec_plus1="$(date -d "${array_date[$((p+1))]}" +'%s')"
                   holiday_days_in_sec_plus2="$(date -d "$year-03-22" +'%s')"
                  if [[ $current_date_in_sec == "$calendar_date_sec" ]];
                #   if [[ $current_date == "$year-$month-$day" ]]
                  then 
                       #Here I'm trying to print current date with start so that I can change color of text in current date 
                      # printf "\e[1m\e[41m\e[033m%3d\e[0m " $day
                      printf "\e[1m\e[033m%3d\e[0m " $day
                      # printf "\e[1;34m%3d\e[0m " $day
                  	  if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
                       then 
                           echo ""
                       fi
                  elif [[ "$holiday_days_in_sec" == "$calendar_date_sec" ]] || [[ "$holiday_days_in_sec" == "$holiday_days_in_sec_plus2" ]]
                  then
                      #  printf "\e[1m\e[47m\e[30m%3d\e[0m " $day
                      #  printf "\e[1m\e[30m%3d\e[0m " $day
                       printf "\e[1;34m%3d\e[0m " $day
                  	  if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
                       then 
                           echo ""
                       fi
                       p=$((p+1))
                       if [[ "$holiday_days_in_sec" == "$holiday_days_in_sec_plus1" ]]; then
                            p=$((p+1))
                       fi
                      #  echo ${array_date[$p]}
                #    elif [[ "$holiday_days_in_sec" == "$holiday_days_in_sec_plus1" ]] 
                #    then
                #         p=$((p+1))
                #    fi
                  else 
                    #    Calling Holiday api function for inserting data in array from holiday_api.sh
                    #    holiday_name_and_date_specific "$year"
                    #    local len=${#array_date[@]}
                    #    for (( i=0; i<len; i++))
                    #    do
                    #        array_date_in_sec="$(date -d "${array_date[i]}" +'%s')"
                    #        if [[ $array_date_in_sec == "$calendar_date_sec" ]]
                    #        then
                    #             printf "\e[1;46m%3d\e[0m " $day
                    #             #Giving whitespace so that It can change the line at the end of the week.
                    #             if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
                    #             then 
                    #                 echo ""
                    #             fi
                    #        else
                    #             printf "%3d " $day
                    #             #Giving whitespace so that It can change the line at the end of the week.
                    #             if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
                    #             then 
                    #                 echo ""
                    #             fi
                    #        fi
                    #    done
                       #Printing day as per spaces 
                       printf "%3d " $day
                       #Giving whitespace so that It can change the line at the end of the week.
                       if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
                       then 
                           echo ""
                       fi
                  fi
                #   sleep "0.002"
                done
                # echo "${array_date[$p]}"
                echo ""
            fi

       fi
fi


}






#Finding calendar of an particular year by giving year
# Syntax =: ./calendar [year]
year_vise_view(){
     if [ $# != 1 ] ;
     then 
         echo "Ooops!!!.. You have not entered correct year."
         exit 0
      fi
     year=$1
     if [[ ! $year =~ ^[0-9]+$ ]];
     then 
        echo "Error: Year ($year ) must be an Integer"
        exit 0
     fi 
        # Chec[king the range of the year wheather is's a four digit value or not ]
      if [ $year -lt 1000 ] || [ $year -gt 9999 ];
      then 
          echo "Error: Year ($year) must be in a range of 1000 to 9999"
          exit 0
      fi
      p=0
     echo -ne "	  $year		"
     for (( k=1; k<=12; k++ ))
       do
       #CAlling the Another for whole year  
       month_and_year_vise_view $k $year
       done

}




# New Function where I'm printing ,a month of current year 
# Syntax : ./calendar -m [Month Name complete]
month_name_vise_view(){
   p=0
   if [[ $# != 2 ]];
   then
       echo "Ooops!!!.. You have not entered correct month or year."
       echo "Try Again"
       exit 0
   fi

   month_identity=$1
   month_name=$2

   if [[ $month_identity != "-m" ]];
   then 
       echo "Error : Doesn't specify the character ( $month_identity )"
       echo "Try using (-m)"
       exit 0
   fi
   
   all_month_names=('january' 'february' 'march' 'april' 'may' 'june' 'july' 'august' 'september' 'october' 'november' 'december')
   month_name_small=$( echo $month_name | awk '{print tolower($0)}')
   # echo $month_name_small
   count_month_num=1
   get_out=0

   for a in "${all_month_names[@]}";
     do
        if [[ $month_name_small == "$a" ]];
        then
            get_out=$(( get_out + 1 ))
            # $(( get_out++ ))
            break
        fi
        count_month_num=$((count_month_num + 1))
     done
     if [[ $get_out == 0 ]];
     then
         echo "Error: Given Month name ($month_name) is not valid"
     else
           # echo $get_out
           # echo $count_month_num
           current_year_number="$( date +'%Y')"
           # echo $current_year_number
           # echo -ne "$current_year_number       "
           month_and_year_vise_view $count_month_num $current_year_number
      fi
      
}




current_year_by_view(){
  p=0
   if [[ $# != 1 ]];
   then
       echo "Ooops!!!.. You have not entered correct month or year."
       echo "Try Again"
       exit 0
   fi

   year_identity=$1
   # month_name=$2

   if [[ $year_identity != "-y" ]];
   then 
       echo "Error : Doesn't specify the character ( $month_identity )"
       echo "Try using (-y)"
       exit 0
   fi
   current_year_num="$(date +'%Y')"
   # echo $current_year_num
   year_vise_view $current_year_num

}



only_with_calendar_cmd(){
   # if [[ $# != 0 ]];
   # then 
   #     echo "Error It can't have arguments "
   #     exit 0
   # fi
   p=0
   cur_year="$(date +'%Y')"
   cur_month="$(date +'%m')"
   # echo $cur_month
   # echo $cur_yearm
   month_and_year_vise_view $cur_month $cur_year 
}



# month_name_vise_view $1 $2
# month_and_year_vise_view $1 $2
# year_vise_view $1
# current_year_by_view $1
# only_with_calendar_cmd 


# if [[ $# == 0 ]];
# then
#     only_with_calendar_cmd
# elif [[ $# == 1 ]];
# then
#      echo
# fi

# case $# in
#    0 ) 
#       only_with_calendar_cmd ;;
#       # break ;;
#    1 )
#       if [[ ! $1 =~ ^[0-9]+$ ]];
#       then
#           current_year_by_view $1
#       elif [[ $1 =~ ^[0-9]+$ ]];
#       then 
#            year_vise_view $1
#       else 
#           year_vise_view $1
#       fi
#       ;;
#    2 )
#       if [[ ! $1 =~ ^[0-9]+$ ]];
#       then
#            month_name_vise_view $1 $2
#       else 
#          month_and_year_vise_view $1 $2
#       fi
# esac

