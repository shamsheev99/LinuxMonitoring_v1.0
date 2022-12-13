#!/bin/bash
cd $(dirname $0)
touch output.txt
echo "HOSTNAME =" $(hostname) | tee output.txt
echo "TIMEZONE =" $(ls -l /etc/localtime | awk -F'/' '{print $7"/"$8}') "UTC"$(date | awk '{print $7}') | tee -a output.txt
#$(timedatectl | awk ' /'Time'/ {print $3} ')
echo "USER =" $USER | tee -a output.txt
echo "OS =" $(cat /etc/issue | cut -d " " -f 1-3) | tee -a output.txt
echo "DATE =" $(date -R | cut -d " " -f 2-5) | tee -a output.txt 
echo "UPTIME =" $(uptime -p | awk '{print $2, $3, $5}') | tee -a output.txt
echo "UPTIME_SEC =" $(cat /proc/uptime | awk '{print $1,"sec"}') | tee -a output.txt
echo "IP =" $(netstat -rn | head -4 | tail +4 | awk '{print $1}') | tee -a output.txt 
mask=$(netstat -rn | head -4 | tail +4 | awk '{print $3}')
echo "MASK =" $mask | tee -a output.txt
echo "GATEWAY =" $(netstat -rn | head -3 | tail +3 | awk '{print $2}') | tee -a output.txt
echo "RAM_TOTAL ="  $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $2/(1024*1024))}') "Gb" | tee -a output.txt
echo "RAM_USED =" $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $3/(1024*1024))}')  "Gb" | tee -a output.txt
echo "RAM_FREE =" $(free  |  head -2 | tail +2 | awk '{printf("%.3f", $4/(1024*1024))}') "Gb" | tee -a output.txt
echo "SPACE_ROOT =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $2/1024)}') "Mb" | tee -a output.txt
echo "SPACE_ROOT_USED =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $3/1024)}') "Mb" | tee -a output.txt
echo "SPACE_ROOT_FREE =" $(df / |  head -2 | tail +2 | awk '{printf("%.2f", $4/1024)}') "Mb" | tee -a output.txt
chmod +x output.sh
./output.sh
#$(ip r | grep enp0s3 | grep -v default | grep -v dhcp | awk '{print $9}')
#$(ip r | grep enp0s3 | grep -v default | grep -v dhcp | awk '{print $1}' | cut -d "/" -f 1)
#$(date | awk '{print $2,$3}')
#zxc=$( hostname )