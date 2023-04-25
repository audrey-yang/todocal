#!/bin/bash

####################################
# CIS 1910 - Spring 2023
# Final Project: TodoCal
# Jason Hom and Audrey Yang
####################################

# assuming we have a "database" called appts.csv
# formatted (date, appt, start, end)

function addAppt {
  printf "\n*** Add appointment ***\n"
  read -p "Enter appointment name: " -r appt
  read -p "Enter date (mm/dd/yy): " -r date  
  read -p "Enter start time (hh:mm): " -r start
  read -p "Enter end time (hh:mm): " -r end
  echo "${date}, ${appt}, ${start}, ${end}" >> appts.csv
  printf "Thanks, added your appointment!\n"
}

function showAppt {
  read -p "What day would you like to view? (mm/dd/yy) " -r day
  count=0
  grep -E "${day}" appts.csv | while read -r line; do
    printf '[%d] %s\n' "$count" "$line"
    (( count++ ))
  done
}

function main() {
  printf 'Welcome! Today is %(%m/%d/%y)T.\n' -1
  printf "Enter a command: " 
  read opt
  while [ ! -z "$opt" ]; do
    case $opt in
      add)
        addAppt
        ;; 
     show)
        showAppt
        ;;
     help)
        printf "\n*** HELP ***\n"
        printf "Available commands:\nadd\nshow\nhelp\nexit\n"
        ;;
     exit)
        break
	;;
      *)
        printf "usage: ./appt.sh [add | show | help | exit]\n"
        ;;
    esac
    echo
    read -p "Enter a command: " -r opt
  done
  printf "Bye!\n"
  exit 0
}

main 
