#!/bin/bash
### Add Alias            ###
### By Robert Bornschein ###

function write_alias_to_file() {
  local file=$1
  local line=$2

  test -z "${file}" && return 10;
  test -z "${line}" && return 10;
  test -f "${file}" || return 20;
  
  echo "${line}" >> "$file";
  test "$?" -eq "0" && return 0 || return $?; 
}

function read_info() {
  local file_tmp=/tmp/aliases.sh;
  local file_consistent=~/.config/bash.d/aliases.sh;
  local _type;
  local alias;
  local origin;
  local line;
  local file;

  _type=$(echo "Temporary|Consistent" | rofi -sep '|' --no-custom -dmenu -i -p "Add Alias:")
  alias=$(rofi -dmenu -p "Alias")
  origin=$(rofi -dmenu -p "Origin")

  line="alias ${alias}=${origin}"

  if [[ $_type =~ "Temporary" ]]; then
    file="${file_tmp}" 
  else 
    file="${file_consistent}" 
  fi
  test -f $file || echo "" > $file

  write_alias_to_file "${file}" "${line}"
}

read_info
