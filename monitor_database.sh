# name: monitor_database.sh
# desc: monitor if database service is running
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

# monitor database
if [ -z "${ORACLE_SID}" -o -z "${LOG_DIR}" -o -z "${DATE_TIME}" -o -z "${DBA_EMAIL}" -o -z "${INCIDENT_NOTIF_EMAIL}" ]
then
  # exit script if missing parameters
  echo "Error: Incorrect config file '$1'. Expected parameters:"
  echo " - ORACLE_SID"
  echo " - LOG_DIR"
  echo " - DATE_TIME"
  echo " - DBA_EMAIL"
  echo " - INCIDENT_NOTIF_EMAIL" 
  exit 1;
else

  . ~/.bash_profile

  # check if instance is running
  DB_INSTANCE_STATUS=`ps -ef | grep smon | grep $ORACLE_SID | tee ${LOG_DIR}/monitor_database_${DATE_TIME}.log | wc -l`

  if [ ${DB_INSTANCE_STATUS} -ne 1 ]
  then
    MSG="DB Instance '${ORACLE_SID}' is DOWN."
    ERROR_STATUS='CRITICAL'
  else
    
    # check if database is open
    echo "select open_mode from v\$database;" | sqlplus / as sysdba | tee ${LOG_DIR}/monitor_database_${DATE_TIME}.log
    DB_OPEN_COUNT=`grep -e 'READ WRITE' ${LOG_DIR}/monitor_database_${DATE_TIME}.log | wc -l`

    if [ "${DB_OPEN_COUNT}" -ne 1 ]
    then
      MSG="DB '${ORACLE_SID}' is NOT OPEN."
      ERROR_STATUS='CRITICAL'
    fi 
  fi
fi

# alert scheme
if [ "${ERROR_STATUS}"="CRITICAL" ]
then
  mailx -s "${ERROR_STATUS} : ${MSG}" ${DBA_EMAIL},${CRITICAL_EMAIL} < ${LOG_DIR}/monitor_database_${DATE_TIME}.log
fi

