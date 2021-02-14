for i in {1..60000}; do  now=$(date +"%m/%d/%Y %H:%M:%S");  \
/mingw32/bin/gnuplot < gpcommands.txt ;\
 sleep 300 ; \
done 
