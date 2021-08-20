BATTERY_DIR=/sys/class/power_supply/BAT0

function get_battery() {
  cat $BATTERY_DIR/capacity
}
alias battery=get_battery
