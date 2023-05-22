#!/usr/bin/bash

source_file_of_all(){

    source calendar2.sh
    # source calendar_events_database.sh
    # source find_events.sh
    source holidays_api.sh
    source date_time_testing.sh
    # source insert_data_in_db.sh
    # source select_all_data.sh
}

source_file_of_all

database_work(){
    source calendar_events_database.sh
    source find_events.sh
    source insert_data_in_db.sh
    source select_all_data.sh
    source update_data.sh
    source delete_data.sh
    source meeting_scheduled.sh
}