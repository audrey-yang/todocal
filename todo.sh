#!/bin/bash

####################################
# CIS 1910 - Spring 2023
# Final Project: TodoCal
# Jason Hom and Audrey Yang
####################################

# assuming we have a "database" called todos.csv
# formatted (date, todo)

function addTodo {
  printf "\n*** Add TODO ***\n"
  read -p "Enter task: " -r todo
  read -p "Enter date for task (mm/dd/yy): " -r date  
  echo "${date}, ${todo}" >> todos.csv
  printf "Thanks, added your task!\n"
}

function showTodos {
  read -p "What day would you like to view? (mm/dd/yy) " -r day
  count=0
  grep -E "${day}" todos.csv | while read -r line; do
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
        addTodo
        ;; 
     show)
        showTodos
        ;;
     help)
        printf "\n*** HELP ***\n"
        printf "Available commands:\nadd\nshow\nhelp\nexit\n"
        ;;
     exit)
        break
	;;
      *)
        printf "usage: ./todo.sh [add | show | help | exit]\n"
        ;;
    esac
    echo
    read -p "Enter a command: " -r opt
  done
  printf "Bye!\n"
  exit 0
}

main 
