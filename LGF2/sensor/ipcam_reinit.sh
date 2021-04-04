#!/bin/bash
progname=$(basename $0)
script_call_dir=${0%$progname}
script_curr_dir=${script_call_dir:-$pwd/}
script_call_string="$progname $@"

echo "progname:"$progname
echo "script_call_dir:"$script_call_dir
echo "script_curr_dir:"$script_curr_dir
echo "script_call_string:"$script_call_string



curl 'http://192.168.1.210:8080/settings/overlay?set=on' 
#curl 'http://192.168.1.210:8080/settings/mirror_flip?set=mirror,flip' 
#curl 'http://192.168.1.210:8080/settings/video_size?set=352x288' 
curl 'http://192.168.1.210:8080/settings/video_size?set=640x480' 


curl 'http://192.168.1.210:8080/settings/overlay?set=on' 
rec_stop=`curl -s "http://192.168.1.210:8080/stopvideo?force=1"`; 
echo $rec_stop ; 
sleep 2 ; 

cs=`curl -s "http://192.168.1.210:8080/settings/video_chunk_len?set=5"` ; 
echo $cs ; 
sleep 1 ; 


now=$(date +"%Y%m%d_%H%M");  
rec_start=`curl -s "http://192.168.1.210:8080/startvideo?force=1&mode=circular&tag=rec$now"`; 
echo $rec_start ; 
