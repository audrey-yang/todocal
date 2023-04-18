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
  echo "${date}, ${todo}"
  echo "${date}, ${todo}" >> todos.csv
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
  printf "What would you like to do? " 
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
        printf "Available commands:\nadd\nhelp\n"
        ;;
      *)
        printf "usage: ./todo.sh [add | help]\n"
        ;;
    esac
    read -p "What would you like to do? " -r opt
  done
  printf "Bye!\n"
  exit 0
}

main 
