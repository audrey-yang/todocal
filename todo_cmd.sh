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
  printf "\n*** My TODOs ***\n"
  count=0
  cat todos.csv | while read -r line; do
    printf '[%d] %s\n' "$count" "$line"
    (( count++ ))
  done
}

function editTodos {
  printf "\n*** Edit TODOs ***\n"
  read -p "Which TODO would you like to edit? Please enter the number: " -r todoNum
  count=0
  while read -r line; do
    if [ $count -eq $((todoNum)) ]; then
      break
    fi
    (( count++ ))
  done < <(cat todos.csv) 
  if [ $count -eq $((todoNum)) ]; then
      read -p "What would you like to replace this TODO with? " -r newTodo
      sed -ri "s/$line/$newTodo/" todos.csv
      printf "TODO updated!\n"
  else
    printf "TODO does not exist\n"
  fi
}

function deleteTodos {
  printf "\n*** Delete TODOs ***\n"
  read -p "Which TODO would you like to delete? Please enter the number: " -r todoNum
  count=0
  while read -r line; do
    if [ $count -eq $((todoNum)) ]; then
      break
    fi
    (( count++ ))
  done < <(cat todos.csv) 
  if [ $count -eq $((todoNum)) ]; then
      sed -ri "/$line/d" todos.csv
      printf "TODO deleted!\n"
  else
    printf "TODO does not exist\n"
  fi
}

function main() {
  case $1 in 
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
    delete)
      showTodos
      deleteTodos
      ;;
    help)
      printf "\n*** HELP ***\n"
      printf "Available commands:\nadd\nshow\nedit\ndelete\nhelp\n"
      ;;
    *)
      printf "usage: ./todo.sh [add | show | edit | delete | help]\n"
      ;;
  esac
}

main $1
