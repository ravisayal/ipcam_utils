#!/bin/bash 
progname=$(basename $0)
script_call_dir=${0%$progname}
script_curr_dir=${script_call_dir:-$pwd/}
script_call_string="$progname $@"

echo "progname:"$progname
echo "script_call_dir:"$script_call_dir
echo "script_curr_dir:"$script_curr_dir
echo "script_call_string:"$script_call_string


now=$(date +"%m/%d/%Y %H:%M:%S");  
echo "Current Time: "$now
# fetch the battery level and save in bl variable \
bl=`curl 'http://192.168.1.210:8080/sensors.json?from=1610841254704&sense=battery_level' \
  -H 'Connection: keep-alive' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Referer: http://192.168.1.210:8080/sensors.html' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure` ; 

 bl="${bl:53:8}" ; 
 bl=`echo $bl | tr -dc '[:alnum:].'` 


# fetch the battery temp and save in bt variable \
bt=`curl 'http://192.168.1.210:8080/sensors.json?from=1612142935259&sense=battery_temp' \
  -H 'Connection: keep-alive' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Referer: http://192.168.1.104:8080/sensors.html' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure` ; 
 bt="${bt:52:8}" ; 
 bt=`echo $bt | tr -dc '[:alnum:].'` 

echo "$now"",""$bl"",""$bt" >> $script_curr_dir/battery_data.csv ; 


#adding git sync logic
git add $script_curr_dir/battery_data.csv
git commit -m "Saving $progname as of $now"
git push
git pull
