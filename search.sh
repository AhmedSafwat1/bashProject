4#!/bin/bash
clear
printf "************ welcom in add search ********* \n"

select choice in "Search By Name" "Search By Email" "Search By Phone"  "Go Home"
do
 case $choice in
    "Search By Name" ) 
        read -p "enter thhe name for search " name
        awk -F: -v a="$name" 'BEGIN {flag=0; OFS=" ";} {if ($1 == a){
                print ("name : " $1 " | email : " $2 " | phone : " $3);
                flag = 1
                }
            }END{if (flag == 0) print "not found ";}' contact.text
        
    ;;
    "Search By Email" ) 
        read -p "enter thhe Email for search " name
        awk -F: -v a="$name" 'BEGIN {flag=0; OFS=" ";} {if ($2 == a){
                print ("name : " $1 " | email : " $2 " | phone : " $3 );
                flag = 1
                }
            }END{if (flag == 0) print "not found ";}' contact.text
    ;;
    "Search By Phone" ) 
        read -p "enter thhe Phone for search " name
        awk -F: -v a="$name" 'BEGIN {flag=0;OFS=" "; } {if ($3 == a){
                print ("name : " $1 " | email : " $2 " | phone : " $3);
                flag = 1
                }
            }END{if (flag == 0) print "not found ";}' contact.text
    ;;
    "Go Home" ) 
        ./main.sh
        break
    ;;
    *) 
        echo " enter the correct Chose"
    ;;
 esac
done