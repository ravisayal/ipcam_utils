now=$(date +"%m/%d/%Y %H:%M:%S");  \
# fetch the battery level and save in bl variable \
bl=`curl 'http://192.168.1.210:8080/sensors.json?from=1610841254704&sense=battery_level' \
  -H 'Connection: keep-alive' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Referer: http://192.168.1.210:8080/sensors.html' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure` ; \
 bl="${bl:53:8}" ; \
 bl=`echo $bl | tr -dc '[:alnum:].'` ;\
# fetch the battery temp and save in bt variable \
bt=`curl 'http://192.168.1.210:8080/sensors.json?from=1612142935259&sense=battery_temp' \
  -H 'Connection: keep-alive' \
  -H 'Accept: */*' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'Referer: http://192.168.1.104:8080/sensors.html' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --compressed \
  --insecure` ; \
 bt="${bt:52:8}" ; \
 bt=`echo $bt | tr -dc '[:alnum:].'` ;\
 echo "$now"",""$bl"",""$bt" >> battery_data.csv ; 
