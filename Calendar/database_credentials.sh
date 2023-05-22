#!/usr/bin/bash

#!/usr/bin/bash

# mysql_user='sql12598186'
# mysql_name='sql12598186'
# mysql_passwd='qabeb9aJY3'
# mysql_hostname='sql12.freemysqlhosting.net'

mysql_user='sql12599946'
mysql_name='sql12599946'
mysql_passwd='vpeGUKmkTw'
mysql_hostname='sql12.freemysqlhosting.net'
port_num='3306'


# mysql_user='root'
# mysql_name='railway'
# mysql_passwd='OTLhGqCHaXGi9c5HT1oQ'
# mysql_hostname='containers-us-west-187.railway.app'

# if mysql -u $mysql_user -p$mysql_passwd -h $mysql_server -e "USE $mysql_name;" ;then
#     echo "SEccessfully connected to database $mysql_name"
# else
#      echo "Failed to connect $mysql_name"
#      exit 1
# fi
   
# if mysql -u $mysql_user -p$mysql_passwd -h $mysql_server -e "USE $mysql_name; Select * from events;" > outputfile.txt; then
#      echo "Successfully retrived data from table"
# else 
#      echo "Failed to retrieve  data from table events"
#      exit 1
# fi
# # if mysql -u $mysql_user -p$mysql_passwd -h $mysql_server -e "USE $mysql_name; insert into events (name,date) values ('Amar Nanda','2003-05-05');"; then
# #      echo "Successfully inserted data "
# # else 
# #      echo "Failed to insert data"
# # fi


# date="2004-11-18"
# name="Harsh Birthday"

# # update events set date='2004-07-17' where name='Rakshit Diwan';

# if mysql -u $mysql_user -p$mysql_passwd -h $mysql_server -e "USE $mysql_name; Update events set date='$date' where name='$name';";then
#      echo "Data UPdated Successfully"
# else
#      echo "Failed to update data"
# fi

# if mysql -u $mysql_user -p$mysql_passwd -h $mysql_server -e "USE $mysql_name; Select * from events;"; then
#      echo "Successfully retrived data from table"
# else 
#      echo "Failed to retrieve  data from table events"
#      exit 1
# fi