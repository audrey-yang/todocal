#!/bin/bash

####################################
# CIS 1910 - Spring 2023
# Final Project: TodoCal
# Jason Hom and Audrey Yang
####################################

# assuming we have a "database" called todos.csv
# formatted (todo)

function addTodo {
  printf "\n*** Add TODO ***\n"
  read -p "Enter task: " -r todo
  echo "${todo}" >> todos.csv
  printf "Thanks, added your task!\n"
}

function showTodos {
  count=0
  while read -r line < todos.csv; do
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
