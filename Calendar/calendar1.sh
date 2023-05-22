#!/usr/bin/bash

#Will have to provide first argument as month and second as year then only it will print the data
month_and_year_vise_view(){
#Checking whether argument provided are correct or not 
   if [ $# -ne  2 ]
   then 
     echo "Ooops!!!.. You have not entered incorrect month or year."
     echo "Try Again"
     exit 0
   fi
#Here I'm declaring 1st and second input to their respective month and years
   month=$1
   year=$2

#Checking whether a month is integer or not 
   if [[ ! $month =~ ^[0-9]+$ ]];
   then 
     echo "Error: Month must be an integer"
     exit 0
   fi
#Checking whether a year is integer or not 
   if [[ ! $year =~ ^[0-9]+$ ]];
   then 
      echo "Error:Year ( $year ) must be an integer"
      exit 0
   fi
#Checking whether given month is in range or not
   if [ $month -lt 1 ] || [ $month -gt 12 ];
   then 
     echo "Error: Month ($month) must be between 1 and 12"
     exit 0
   fi

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
#  echo ${days_in_months[@]}
  
#Finding first day of the month,last day and current date 
   start_day_month="$(date -d "$year-$month-01" +'%u')"
   last_day_month="$(date -d "$year-$month-01" +'%d')"
   month_name="$(date -d "$year-$month-01" +'%B')"
   current_date="$(date +'%F')"
   # current_date_in_sec="$(date -d "$current_date" +'%s')"

#   current_month
#   echo $start_day_month
    
#   echo $current_date_in_sec
   echo ""
   echo "        " $month_name "$year"
   echo "Mon Tue Wed Thu Fri Sat Sun"
   #Increasing the sapces as per the date starts from which day
   for (( i=0; i<start_day_month-1; i++ ));
    do 
      echo -n "    "
    done
   
   for (( day=1; day<=days_in_months[month-1]; day++ ))
   do 
      #Finding date of calendar in seconds      
      # calendar_date_sec="$(date -d "$year-$month-$day" +'%s')"
      #After Findind Just Comparing it with current date so that I can highlight current date
   #   if [[ $current_date_in_sec == $calendar_date_sec ]];
   #   then 
          #Here I'm trying to print current date with start so that I can get * in current date 
          #But not getting the desired output 
          
   #        printf "%3d " $day
   #   	  if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
   #        then 
   #            echo ""
   #        fi
   #   else 
          #Printing day as per spaces 
          printf "%3d " $day
          #Giving whitespace so that It can change the line at the end of the week.
          if [ $(((day + start_day_month-1 ) % 7)) == 0 ];
          then 
              echo ""
          fi
   #   fi
   #   sleep "0.002"
   done
   echo ""
}

# month_and_year_vise_view $1 $2




#Finding calendar of an particular year by giving year
year_vise_view(){
     if [ $# != 1 ] ;
     then 
         echo "Ooops!!!.. You have not entered incorrect year."
         exit 0
      fi
     year=$1
     if [[ ! $year =~ ^[0-9]+$ ]];
     then 
        echo "Error: Year ($year ) must be an Integer"
        exit 0
     fi 
     echo -ne "	  $year		"
     for (( k=1; k<=12; k++ ))
       do
       #CAlling the Another for whole year  
       month_and_year_vise_view $k $year
       done

}

year_vise_view $1



# New Function where I'm printing ,a month of current year 
month_name_vise_view(){
   
   if [[ $# != 2 ]];
   then
       echo "Ooops!!!.. You have not entered incorrect month or year."
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
        if [[ $month_name_small == $a ]];
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
         exit 0
      fi
      # echo $get_out
      # echo $count_month_num
      current_year_number="$( date +'%Y')"
      # echo $current_year_number
      # echo -ne "$current_year_number       "
      month_and_year_vise_view $count_month_num $current_year_number
}

# month_name_vise_view $1 $2
