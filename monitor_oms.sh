# name: monitor_oms.sh
# desc: monitor if oracle management service (oms) is running
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

# monitor oms
if [ -z "${OMS_HOME}" -o -z "${LOG_DIR}" -o -z "${DATE_TIME}" -o -z "${DBA_EMAIL}" -o -z "${INCIDENT_NOTIF_EMAIL}" ]
then
  # exit script if missing parameters
  echo "Error: Incorrect config file '$1'. Expected parameters:"
  echo " - OMS_HOME"
  echo " - LOG_DIR"
  echo " - DATE_TIME"
  echo " - DBA_EMAIL"
  echo " - INCIDENT_NOTIF_EMAIL" 
  exit 1;
else

  . ~/.bash_profile
  $OMS_HOME/bin/emctl status oms | tee ${LOG_DIR}/monitor_oms_${DATE_TIME}.log
  OMS_STATUS_COUNT=`grep -e 'Down' ${LOG_DIR}/monitor_oms_${DATE_TIME}.log | wc -l`

  if [ ${OMS_STATUS_COUNT} -gt 0 ]
  then
    MSG="EM OMS Service on `hostname` is DOWN."
    ERROR_STATUS='CRITICAL'
  fi
fi

# alert scheme
if [ "${ERROR_STATUS}"="CRITICAL" ]
then
  mailx -s "${ERROR_STATUS} : ${MSG}" ${DBA_EMAIL},${INCIDENT_NOTIF_EMAIL} < ${LOG_DIR}/monitor_listener_${DATE_TIME}.log
fi
