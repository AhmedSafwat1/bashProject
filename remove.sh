#!/bin/bash
clear
color='\033[0;31m'
cd="\033[0m"

printf "************ welcom in Remove ********* \n"
read -p "enter the phone " phone
while [ -z $phone ]; do 
    read -p "enter the phone " phone      
done
while [ -n $phone ];do

    if [[ "$phone" =~ ^01[5|1|2|0][0-9]{8} ]]
        then 
        if [[ $(cut -f 3 -d: contact.text|grep "$phone") ]]
            then

            break  
        fi
    fi
    read -p "enter the coorect mobile and exist or write  home  to go home : " phone
    if [ $phone = "home" ]
        then
            ./main.sh
            break
    fi  
done
awk -F: -v a="$phone" 'BEGIN {flag=0;} {if ($3 == a){
                flag = 1
                }
                else
                    print $0
            }END{ }' contact.text >> contact2.text
mv contact2.text contact.text

echo "Delete sucess"
sleep  1s
./main.sh