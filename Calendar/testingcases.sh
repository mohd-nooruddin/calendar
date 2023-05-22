#!/usr/bin/bash

 date="2003-04-05"

 if [[ $date =~ [0-9]*+$ ]];
 then
     echo "It's all right"
else 
     echo "Contains character"
  fi