# name: monitor_disk.sh
# desc: monitors disk utilization
# auth: Richard Koranteng (rkkoranteng.com)
# ---
#!/bin/bash

# check usage ... exit if no config param file supplied
if [ $# -ne 1 ]
then
  echo "Usage: $0 <config.rsp>"
  exit 1;
fi

CONFIG_FILE=$1

# source environment config file ... exit if config param file not found
if [ -f "${CONFIG_FILE}" ]
then
  . ./${CONFIG_FILE}
else
  echo "Error: Missing config file '${CONFIG_FILE}'"
  exit 1;  
fi

# monitor disk/mountpoints
if [ -z "${PROACTIVE_MOUNTPOINT_UTILIZATION}" -o -z "${CRITICAL_MOUNTPOINT_UTILIZATION}" -o -z "${LOG_DIR}" -o -z "${DATE_TIME}" -o -z "${DBA_EMAIL}" -o -z "${INCIDENT_NOTIF_EMAIL}" ]
then
  # exit script if missing parameters
  echo "Error: Incorrect config file '$1'. Expected parameters:"
  echo " - PROACTIVE_MOUNTPOINT_UTILIZATION"
  echo " - CRITICAL_MOUNTPOINT_UTILIZATION"
  echo " - LOG_DIR"
  echo " - DATE_TIME"
  echo " - DBA_EMAIL"
  echo " - INCIDENT_NOTIF_EMAIL" 
  exit 1;
else

  . ~/.bash_profile
  df -h > ${LOG_DIR}/monitor_disk.tmp

  grep -v -E "$(echo "$IGNORE_MOUNTPOINT" | sed 's/,/|/g')" ${LOG_DIR}/monitor_disk.tmp

fi 
