#!/bin/bash

<<comment
cd="\033[0m"
color='\033[0;31m'
pc='\033[42m'
printf "${color}${pc}welcom \n"  
comment
clear


cat << "EOF"



 __    __   ___ _        __  ___  ___ ___      ____ ____       __ __  ___  ___ ___   ___        
|  |__|  | /  _] |      /  ]/   \|   |   |    |    |    \     |  |  |/   \|   |   | /  _]       
|  |  |  |/  [_| |     /  /|     | _   _ |     |  ||  _  |    |  |  |     | _   _ |/  [_        
|  |  |  |    _] |___ /  / |  O  |  \_/  |     |  ||  |  |    |  _  |  O  |  \_/  |    _]       
|  `  '  |   [_|     /   \_|     |   |   |     |  ||  |  |    |  |  |     |   |   |   [_        
 \      /|     |     \     |     |   |   |     |  ||  |  |    |  |  |     |   |   |     |       
  \_/\_/ |_____|_____|\____|\___/|___|___|    |____|__|__|    |__|__|\___/|___|___|_____| 


  --------------------------------------------------------------------
    Copy Rtight ITI Made by Ahmed Safwat ,Reham Salah Mohamed
      
                                                                                                
EOF


select choice in "Add Contact" "Edit Contact" "Remove contact" "Search for contacts" "Exit"
do
 case $choice in
    "Add Contact" ) 
        ./add.sh
        break
    ;;
    "Edit Contact" )
        ./update.sh
        break
    ;;
    "Remove contact" )
        ./remove.sh
        break
    ;;
    "Search for contacts" )
        ./search.sh
        break
    ;;
    "Exit" )
        break
    ;;
    * )
        echo "Chose the cooreect plz "
    ;;
 esac
done
