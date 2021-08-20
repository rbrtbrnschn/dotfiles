#!/bin/bash
BACKLIGHT_DIR=/sys/class/backlight/amdgpu_bl0
BRIGHTNESS_FILE=${BACKLIGHT_DIR}/brightness
MAX_BRIGHTNESS_FILE=${BACKLIGHT_DIR}/max_brightness

function get_brightness() {
  cat $BRIGHTNESS_FILE;
}
function get_max_brightness() {
  cat $MAX_BRIGHTNESS_FILE;
}
function set_brightness() {
  local new_brightness=$1;
  local max_brightness=$(get_max_brightness)
  local new_brightness_is_valid=0;
  if [[ $new_brightness -lt 0 ]]; then
    new_brightness_is_valid=2;
  elif [[ $new_brightness -gt $max_brightness ]]; then
    new_brightness_is_valid=1;
  fi

  if [[ $new_brightness_is_valid -eq 0 ]]; then
    echo $new_brightness | sudo tee $BRIGHTNESS_FILE; 
  elif [[ $new_brightness_is_valid -eq 1 ]]; then
    echo "Brightness level too low. Minimum is 0."
    return 1;
  elif [[ $new_brightness_is_valid -eq 2 ]]; then
    echo "Brightness level too high. Maxiumus is $max_brightness"
    return 1;
  fi
}
