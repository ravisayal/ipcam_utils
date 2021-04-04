# https://alexharv074.github.io/2018/09/22/the-four-sql-joins-using-linux-join-and-sort.html


ps af|sort -n -k 4|sed 's/ \{1,\}/,/g' |cut -c 2- |grep -v "PID" > a.txt
wmic process get ProcessID, Commandline, CREATIONDATE /format:csv|grep msys |grep sh|tr " " "."|sort -n -t, -k 4 > b.txt
join -1 4 -2 4 -t, -o 1.1,1.4,2.3,2.2 a.txt b.txt


join -1 4 -2 4 -t, -o 1.1,1.4,2.3,2.2  \
<(ps af|sort -n -k 4|sed 's/ \{1,\}/,/g' |cut -c 2- |grep -v "PID" )  \
<(wmic process get ProcessID, Commandline, CREATIONDATE /format:csv|grep msys |grep sh|tr " " "."|sort -n -t, -k 4 ) 
