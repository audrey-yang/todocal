#!/bin/bash

####################################
# CIS 1910 - Spring 2023
# Final Project: TodoCal
# Jason Hom and Audrey Yang
####################################

function main() {
   case $1 in 
      todo)
         case $2 in
            add)
               ./todo_cmd.sh add
               ;; 
            show)
               ./todo_cmd.sh show
               ;;
            edit)
               ./todo_cmd.sh edit
               ;;
            delete)
               ./todo_cmd.sh delete
               ;;
            "")
               ./todo.sh
               ;;
            *)
               printf "Error: unrecognized :("
               ;;
         esac
         ;;
      cal)
         case $2 in
            add)
               ./appt_cmd.sh add
               ;; 
            show)
               ./appt_cmd.sh show
               ;;
            today)
               ./appt_cmd.sh today
               ;;
            edit)
               ./appt_cmd.sh edit
               ;;
            delete)
               ./appt_cmd.sh delete
               ;;
            "")
               ./appt.sh
               ;;
            *)
               printf "Error: unrecognized :("
               ;; 
         esac
         ;;
      help)
         printf "\n*** HELP ***\n"
         printf "Available commands:\n[todo|cal] [add|show|edit|delete]\n"
         ;;
      *)
         printf "Usage:\n./todocal.sh [todo|cal] [add|show|edit|delete]\n"
         ;;
   esac
   exit 0
}

main $1 $2