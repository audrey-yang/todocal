# todocal
CIS 191 Final Project

By [@homjason](https://github.com/homjason) and [@audrey-yang](https://github.com/audrey-yang)

## Instructions for use

### Commands

- `./todocal.sh` + 
  - `todo`
    - `add`
    - `show`
    - `edit`
    - `delete`
    - No arguments: interactive mode 
  - 'cal'
    - `add`
    - `show`
    - `today` (shows today's appointments)
    - `edit`
    - `delete`
    - No arguments: interactive mode 
  - 'help'

### How to make show TODOs/appointments on shell boot

Open your `.bash_profile` and add

- `./todocal/todocal.sh todo show` for TODOs
- `./todocal/todocal.sh cal today` for appointments

## Miscellaneous notes about the code

- Top-level `todocal.sh` provides an entrypoint into both TODO and cal functionalities
- Assumes the presence of files called `todos.csv` and `appts.csv` to track TODOs and appointments

## Getting the source code

Use `git clone` with this repo.
