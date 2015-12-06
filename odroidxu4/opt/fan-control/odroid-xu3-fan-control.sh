#!/bin/bash

#The MIT License (MIT)
#
#Copyright (c) 2015 Tomasz Nazar
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#

# Loud fan control script to lower speed of fun based on current
# max temperature of any cpu
#
# See https://github.com/nthx/odroid-xu3-fan-control for details.

#set to false to suppress logs
DEBUG=false

# Make sure only root can run our script
if (( $EUID != 0 )); then
   echo "This script must be run as root:" 1>&2
   echo "sudo $0" 1>&2
   exit 1
fi

if [ -f /sys/devices/odroid_fan.13/fan_mode ]; then
   FAN=13
elif [ -f /sys/devices/odroid_fan.14/fan_mode ]; then
   FAN=14
else
   echo "This machine is not supported."
   exit 1
fi

TEMPERATURE_FILE="/sys/devices/10060000.tmu/temp"
FAN_MODE_FILE="/sys/devices/odroid_fan.$FAN/fan_mode"
FAN_SPEED_FILE="/sys/devices/odroid_fan.$FAN/pwm_duty"
TEST_EVERY=3 #seconds
LOGGER_NAME=odroid-xu3-fan-control

#make sure after quiting script fan goes to auto control
function cleanup {
  ${DEBUG} && logger -t $LOGGER_NAME "event: quit; temp: auto"
  echo 1 > ${FAN_MODE_FILE}
}
trap cleanup EXIT

function exit_xu3_only_supported {
  ${DEBUG} && logger -t $LOGGER_NAME "event: non-xu3 $1"
  exit 2
}
if [ ! -f $TEMPERATURE_FILE ]; then
  exit_xu3_only_supported "no temp file"
elif [ ! -f $FAN_MODE_FILE ]; then
  exit_xu3_only_supported "no fan mode file"
elif [ ! -f $FAN_SPEED_FILE ]; then
  exit_xu3_only_supported "no fan speed file"
fi


current_max_temp=`cat ${TEMPERATURE_FILE} | cut -d: -f2 | sort -nr | head -1`
echo "fan control started. Current max temp: ${current_max_temp}"
echo "For more logs see:"
echo "sudo tail -f /var/log/syslog"

prev_fan_speed=0
echo 0 > ${FAN_MODE_FILE} #to be sure we can manage fan

while [ true ];
do

  current_max_temp=`cat ${TEMPERATURE_FILE} | cut -d: -f2 | sort -nr | head -1`
  ${DEBUG} && logger -t $LOGGER_NAME "event: read_max; temp: ${current_max_temp}"

  new_fan_speed=0
  if (( ${current_max_temp} >= 95000 )); then
    new_fan_speed=255
  elif (( ${current_max_temp} >= 80000 )); then
    new_fan_speed=150
  elif (( ${current_max_temp} >= 70000 )); then
    new_fan_speed=100
  elif (( ${current_max_temp} >= 66000 )); then
    new_fan_speed=60
  elif (( ${current_max_temp} >= 63000 )); then
    new_fan_speed=55
  elif (( ${current_max_temp} >= 60000 )); then
    new_fan_speed=50
  elif (( ${current_max_temp} >= 58000 )); then
    new_fan_speed=40
  elif (( ${current_max_temp} >= 55000 )); then
    new_fan_speed=30
  elif (( ${current_max_temp} >= 50000 )); then
    new_fan_speed=20
  else
    new_fan_speed=1
  fi

  if (( ${prev_fan_speed} != ${new_fan_speed} )); then
    ${DEBUG} && logger -t $LOGGER_NAME "event: adjust; speed: ${new_fan_speed}"
    echo ${new_fan_speed} > ${FAN_SPEED_FILE}
    prev_fan_speed=${new_fan_speed}
  fi

  sleep ${TEST_EVERY}
done

