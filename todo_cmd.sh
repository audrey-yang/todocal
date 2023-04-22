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

function showTodosToday {
  printf "Today's todos: \n"
  today=$(date +'%m/%d/%y')
  count=0
  grep -E "${today}" ~/todocal/todos.csv | while read -r line; do
    printf '[%d] %s\n' "$count" "$line"
    (( count++ ))
  done
}

function main() {
  case $1 in 
    add)
      addTodo
      ;; 
   show)
      showTodos
      ;;
   today)
      showTodosToday
      ;;      
   help)
      printf "\n*** HELP ***\n"
      printf "Available commands:\nadd\nhelp\n"
      ;;
    *)
      printf "usage: ./todo.sh [add | help]\n"
      ;;
  esac
}

main $1
