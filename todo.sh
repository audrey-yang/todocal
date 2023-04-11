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

function main() {
  case $1 in
    
    add)
      addTodo
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

