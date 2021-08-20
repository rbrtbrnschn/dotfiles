#!/bin/bash

function set_package_manager() {
  if [[ -z "$PACKAGE_MANAGER" ]]; then
    PACKAGE_MANAGER="$1";
  fi
}
function set_auxiliary_package_manager() {
  if [[ -z "$AUXILIARY_PACKAGE_MANAGER" ]]; then
    AUXILIARY_PACKAGE_MANAGER="$1";
  fi
}

function handle_os() {
  local os;
  local package_manager;
  local auxiliary_package_manager;

  if [[ "$(uname)" -eq "Linux" ]]; then
    #TODO - #1
    if [ -f /etc/arch-release ]; then
      os=arch;
      package_manager="pacman -S";
      auxiliary_package_manager="yay -S";
    elif [ -f /etc/ubuntu-release ]; then
      os=ubuntu
      package_manager="apt-get install -y";
      set_auxiliary_package_manager="snap install";
    elif [ -f /etc/debian_version ]; then
      os=debian
      package_manager="apt-get install -y";
      set_auxiliary_package_manager="snap install";
    elif [ -f /etc/redhat-release ]; then
      os=redhat
    elif [ -f /etc/SuSE-release ]; then
      os=suse
    fi
  else
    os=unknown
  fi

  set_package_manager "$package_manager";
  set_auxiliary_package_manager "$auxiliary_package_manager";

  echo "$os"
}

function read_dependencies() {
  local default_dependencies_file=~/.config/dependencies.sh;
  if [[ -f $DEPENDENCIES_FILE ]]; then
    cat $DEPENDENCIES_FILE;
  elif [[ -f $default_dependencies_file ]];then
    cat $default_dependencies_file
  else
    return 1;
  fi
}

function install() {
  local dependency="$1";
  local return_code;
  $PACKAGE_MANAGER $dependency;
  return_code=$?;
  if [[ $return_code -gt 0 ]];then
    $AUXILIARY_PACKAGE_MANAGER $dependency;
    return_code=$?;
    if [[ $return_code -eq 1 ]]; then
      return 1;
    elif [[ $return_code -eq 127 ]]; then
      return 127
    fi
  fi
  return 0;
}

function main() {
  local dependencies=$(read_dependencies);
  if [[ $? -gt 0 ]]; then
    echo "DEPENDENCIES_FILE not set. Couldnt not locate file."
    return 1
  fi;
  local return_code;
  local installtion_has_errored=1;
  local log_file=/tmp/install.log;
  if [[ -n $LOG_FILE ]]; then
    log_file=$LOG_FILE;
  fi
  if [[ -f $log_file ]]; then
    rm $log_file;
  fi

  handle_os > /dev/null 2>&1;
  if [[ $? -gt 0 ]];then
    return 1;
  fi

  echo "$dependencies"
  for dep in $dependencies; do
    if [[ "$dep" =~ "#" ]];then 
      continue;
    fi

    install "$dep"
    return_code=$?;
    if [[ $return_code -eq 1 ]];then
      echo "Failed to install $dep" >> $log_file;
      installtion_has_errored=0;
    elif [[ $return_code -eq 127 ]];then
      return 127;
    fi 
    
  done

  if [[ $installtion_has_errored -eq 0 ]];then
    echo "Errors occured. Log file located at $log_file."
    return 1;
  fi
}

main;


#TODO
# #1 - add if checks for more linux distros, debian, ubuntu, atleast
