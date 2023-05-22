#!/usr/bin/bash

# curl -H "Accept: application/json" "http:"
# curl -H "Accept: application/json" "https://api.calendarific.com/v2/holidays?api_key=bc52d036fa805971debd289827b81354151fa64d&country=INDIA&year=2023" > holidays.sh

# https://api.calendarific.com/v2/holidays?api_key=bc52d036fa805971debd289827b81354151fa64d&country=INDIA&year=2023

# curl -H "Accept: application/json" "https://api.calendarific.com/v2/holidays?api_key=bc52d036fa805971debd289827b81354151fa64d&country=US&year=2023" > holidays.sh
# curl -H "Accept: application/json" "https://calendarific.com/api/v2/holidays?api_key=bc52d036fa805971debd289827b81354151fa64d&country=IN&year=2023" > holidays.txt
# ?api_key=bc52d036fa805971debd289827b81354151fa64d&country=IN&year=2023

array_date=()
array_holiday_name=()
count=0

holiday_name_and_date(){
    url="https://calendarific.com/api/v2/holidays"
    # country_code="IN"
    calendar_year="$1"
    # api_key="bc52d036fa805971debd289827b81354151fa64d"
    api_key="553c0e13b096f0ec237a2e0f9c922979da55c859"
    # curl -s "$url?api_key=$api_key&country=$country_code&year=$calendar_year"
    response=$(curl -s "$url?api_key=$api_key&country=IN&year=$calendar_year" | jq -r '.response.holidays[] | "\(.date.iso) \(.name)"')
    echo "Holidays For year $calendar_year "
    echo "---------------------------------------------------"
    while  read line; do
      date=$(echo $line | cut -d " " -f 1)
      name=$(echo $line | cut -d " " -f 2-)
      var="$date  $name"
      if [[ $var != "$calendar_year-12-22T08:57:21+05:30  December Solstice" ]] && [[ $var != "$calendar_year-09-23T12:20:01+05:30  September Equinox" ]] && [[ $var != "$calendar_year-06-21T20:27:49+05:30  June Solstice" ]] && [[ $var != "$calendar_year-03-21T02:54:20+05:30  March Equinox" ]];
      then
         echo "$date  $name"
        #  array_date[$count]=$date
        #  array_holiday_name[$count]=$name
        #  count=$(( count + 1))
      fi
        
    done <<< "$response"
    # curl -v "$url?api_key=$api_key&country=$country_code&year=$calendar_year" | jq --raw-output '.name' > holiday.txt
}

# holiday_name_and_date
# echo "${array_date[@]}"
# echo "${array_holiday_name[@]}"

holiday_name_and_date_specific(){
    url="https://calendarific.com/api/v2/holidays"
    # country_code="IN"
    calendar_year="$1"
    # api_key="bc52d036fa805971debd289827b81354151fa64d"
    api_key="553c0e13b096f0ec237a2e0f9c922979da55c859"
    # curl -s "$url?api_key=$api_key&country=$country_code&year=$calendar_year"
    response=$(curl -s "$url?api_key=$api_key&country=IN&year=$calendar_year" | jq -r '.response.holidays[] | "\(.date.iso) \(.name)"')
    # holidays=$(echo "$response" | jq '.response.holidays[]')
    
    # for holiday in $holidays;
    # do
    #    name=$(echo "$holiday" | jq -r '.name')
    #    date=$(echo "$holiday" | jq -r '.date.iso')
    #    echo "$name on $date"
    # done
    while  read line; do
      date=$(echo $line | cut -d " " -f 1)
      name=$(echo $line | cut -d " " -f 2-)
      var="$date  $name"
      if [[ $var != "$calendar_year-12-22T08:57:21+05:30  December Solstice" ]] && [[ $var != "$calendar_year-09-23T12:20:01+05:30  September Equinox" ]] && [[ $var != "$calendar_year-06-21T20:27:49+05:30  June Solstice" ]] && [[ $var != "$calendar_year-03-21T02:54:20+05:30  March Equinox" ]];
      then
            array_date[$count]=$date
            array_holiday_name[$count]=$name
            count=$(( count + 1))
      fi
        
    done <<< "$response"
    # curl -v "$url?api_key=$api_key&country=$country_code&year=$calendar_year" | jq --raw-output '.name' > holiday.txt
}


# comparing_dates(){
#   local len=${#array_date[@]}
#   for (( i=0; i<len; i++ ))
#   do
#       if [[ ${array_date[i]} == "2023-12-25" ]];
#       then
#            echo "Here is holiday"
#       fi
#   done
# }
# holiday_name_and_date "2023"
# comparing_dates
holiday_name_and_date_specific "2023"