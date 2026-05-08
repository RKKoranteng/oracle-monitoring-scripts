# name: setup.sh
# desc: deploy monitoring scripts
# auth: Richard Koranteng (rkkoranteng.com)
# ---
#!/bin/bash

# check usage ... exit if no config param file supplied
if [ $# -ne 1 ]
then
  echo "Usage: $0 <config.rsp>"
  exit 1;
else

  CONFIG_FILE=$1

  # source environment config file ... exit if config param file not found
  if [ -f "${CONFIG_FILE}" ]
  then
    . ./${CONFIG_FILE}
  else
    echo "Error: Missing config file '${CONFIG_FILE}'"
    exit 1;  
  fi

  # build list of mandatory variables from config file comments
  MANDATORY_VARS=$(
    awk '
      BEGIN { name="" }
      /^[[:space:]]*# name[[:space:]]*:/ {
        split($0, a, ":")
        name=a[2]
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", name)
      }
      /^[[:space:]]*# mandatory[[:space:]]*:/ {
        line=tolower($0)
        if (line ~ /yes/ && name != "") {
          print name
        }
        name=""
      }
    ' "${CONFIG_FILE}"
  )

  MISSING_VARS=()

  for VAR in ${MANDATORY_VARS}; do
    if [ -z "${!VAR}" ]; then
      MISSING_VARS+=("${VAR}")
    fi
  done

  if [ ${#MISSING_VARS[@]} -gt 0 ]; then
    echo "Error: Incorrect config file '${CONFIG_FILE}'. Missing mandatory parameters:"
    for VAR in "${MISSING_VARS[@]}"; do
      echo " - ${VAR}"
    done
    exit 1
  else
    echo "`date` : Config validation passed for '${CONFIG_FILE}'"
  fi

  # create required monitoring directories
  mkdir -p ${SCRIPT_DIR}
  mkdir -p ${LOG_DIR}

  echo "`date` : Monitoring scripts successfully deployed"

fi