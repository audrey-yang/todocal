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

function showApptsToday {
  printf "\n*** Today's appointments ***\n"
  today=$(date +'%m/%d/%y')
  count=0
  grep -E "${today}" ~/todocal/appts.csv | while read -r line; do
    printf '[%d] ' "$count"
    echo $line | sed -r 's/^(.*), (.*), (.*), (.*)$/\3-\4: \2/'
    (( count++ ))
  done
}

function main() {
  case $1 in 
    add)
      addAppt
      ;; 
   show)
      showAppt
      ;;
   today)
      showApptsToday
      ;;
   help)
      printf "\n*** HELP ***\n"
      printf "Available commands:\nadd\nhelp\n"
      ;;
    *)
      printf "usage: ./todo.sh [add | help]\n"
      ;;
  esac
  exit 0
}

main $1
