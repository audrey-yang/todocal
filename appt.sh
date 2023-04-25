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
  echo "${date},${appt},${start},${end}" >> appts.csv
  printf "Thanks, added your appointment!\n"
}

function showAppt {
  read -p "What day would you like to view? (mm/dd/yy) " -r day
  count=0
  grep -E "${day}" appts.csv | while read -r line; do
    printf '[%d] ' "$count"
    echo $line | sed -r 's/^(.*),(.*),(.*),(.*)$/\3-\4: \2/'
    (( count++ ))
  done
}

function showApptsToday {
  printf "\n*** Today's appointments ***\n"
  today=$(date +'%m/%d/%y')
  count=0
  grep -E "${today}" ~/todocal/appts.csv | while read -r line; do
    printf '[%d] ' "$count"
    echo $line | sed -r 's/^(.*),(.*),(.*),(.*)$/\3-\4: \2/'
    (( count++ ))
  done
}

function editAppt {
  printf "*** Your appointments ***\n"
  cat appts.csv | while read -r line; do
    printf '[%d] ' "$count"
    echo $line | sed -r 's/^(.*),(.*),(.*),(.*)$/\3-\4: \2/'
    (( count++ ))
  done
  read -p "Which appointment would you like to edit? Please enter the number: " -r num
  count=0
  while read -r line; do
    if [ $count -ge $((num)) ]; then
      break
    fi
    (( count++ ))
  done < <(cat appts.csv)
  if [ $count -eq $((num)) ]; then
      read -p "What would you like to replace this appointment with? " -r newAppt
      date="$(cut -d ',' -f 1 <<<$line)"
      startTime="$(cut -d ',' -f 3 <<<$line)"
      endTime="$(cut -d ',' -f 4 <<<$line)"
      sed -ri "s~$line~$date,$newAppt,$startTime,$endTime~" appts.csv
      printf "Appointment updated!\n"
  else
    printf "Error: appointment does not exist\n"
  fi
}

function deleteAppt {
  printf "*** Your appointments ***\n"
  cat appts.csv | while read -r line; do
    printf '[%d] ' "$count"
    echo $line | sed -r 's/^(.*),(.*),(.*),(.*)$/\3-\4: \2/'
    (( count++ ))
  done
  read -p "Which appointment would you like to delete? Please enter the number: " -r apptNum
  count=0
  while read -r line; do
    if [ $count -eq $((apptNum)) ]; then
      break
    fi
    (( count++ ))
  done < <(cat appts.csv) 
  if [ $count -eq $((apptNum)) ]; then
      sed -ri "\~$line~d" appts.csv
      printf "Appointment deleted!\n"
  else
    printf "Error: appointment does not exist\n"
  fi
}

function main() {
  printf 'Welcome! Today is %(%m/%d/%y)T.\n' -1
  printf "\tadd\n\tshow\n\tedit\n\tdelete\n\thelp\n\texit\n"
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
      edit)
        editAppt
        ;;
      delete)
        deleteAppt
        ;;
	    today)
      	showApptsToday
    	  ;;
      help)
        printf "\n*** HELP ***\n"
        printf "Available commands:\nadd\nshow\nhelp\nexit\n"
        ;;
      exit)
        break
	      ;;
      *)
        printf "usage: ./appt.sh [add | show | edit | delete | help | exit]\n"
        ;;
    esac
    echo
    read -p "Enter a command: " -r opt
  done
  printf "Bye!\n"
  exit 0
}

main 
