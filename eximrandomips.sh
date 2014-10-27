#!/bin/bash
#script to change the ip of outgoing e-mail exim
#you must add a line in crontab
#*/15 * * * * sh /your_path/eximrandomips.sh
#powered by Tiago Matos - web developer :: www.tiagomatos.com

#path
path=/etc/mailips

#ip list
ips=("XXX.XXX.XXX.XXX" "XXX.XXX.XXX.XXX")

#read current ip
mailips=`head -n 1 ${path}`
current_ip=${mailips##*: }

#delete current ip of ips array
for i in ${!ips[@]}; do
	if [ "${ips[$i]}" == ${current_ip} ]; then
		unset ips[$i]
	fi
done

#shuffle ips
ips_shuf=($(shuf -e ${ips[*]}))

#write new ip in mailips
echo "*:" ${ips_shuf[0]} > ${path}