echo $(date +"%m/%d/%Y %H:%M:%S")- $PWD Process ID  $! >> process.txt
tail -1 process.txt
