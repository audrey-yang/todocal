#!/bin/bash

####################################
# CIS 1910 - Spring 2023
# Final Project: TodoCal
# Jason Hom and Audrey Yang
####################################

function main() {
  printf 'Welcome! Today is %(%m/%d/%y)T.\n' -1
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
	  if [ ! -z "$opt" ]; then
	  	
	  fi
      printf "usage: ./todo.sh [add | help]\n"
      ;;
  esac
  printf "Enter a command: " 
  read opt
  while [ ! -z "$opt" ]; do
    case $opt in
      todo-add)
        todo_cmd add
        ;; 
     todo-show)
        todo_cmd show
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