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
  # read -p "Enter date for task (mm/dd/yy): " -r date  
  echo "${todo}" >> todos.csv
  printf "Thanks, added your task!\n"
}

function showTodos {
  count=0
  cat todos.csv | while read -r line; do
    printf '[%d] %s\n' "$count" "$line"
    (( count++ ))
  done
}

function editTodos {
  read -p "Which TODO would you like to edit? Please enter the number of the TODO: " -r todoNum
  count=0
  todos=$(cat todos.csv)
  read -r line < todos.csv
  while [ $count -le $((todoNum)) ]; do
    if [ $count -eq $((todoNum)) ]; then
      read -p "What would you like to replace this TODO with? " -r newTodo
      sed -ri "s/$line/$newTodo/" todos.csv
      printf "TODO updated!\n"
    fi
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
     edit)
        showTodos
        editTodos
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
