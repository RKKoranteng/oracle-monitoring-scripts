#!/bin/bash
#########################################################################################################################
##                                      Oracle Monitoring Config Parameter File                                        ##
##                                        Richard Koranteng (rkkoranteng.com)                                          ##
##                                                                                                                     ##                                                                               
##  - specify values for the variables listed below to customize                                                       ##
##  - each variable is associated with a comment to populate the variables with the appropriatE values                 ##
##  - this file should have rwx permission by oracle user                                                              ##
#########################################################################################################################       
#------------------------------------------------------------------------------------------------------------------------
# do not change the following system generated value(s) and configs
DATE_TIME=`date +"%m%d%y_%H%M"`
VERSION='1.2.0'
#------------------------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------------------------
# name          : SCRIPT_DIR
# datatype:     : string (directory path)
# description   : directory where scripts are stored and executed.
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
SCRIPT_DIR='/home/oracle/rk/monitoring'

#------------------------------------------------------------------------------------------------------------------------
# name          : LOG_DIR
# datatype:     : string (directory path)
# description   : absolute path where logs are stored. must exist and be writable
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
LOG_DIR='/home/oracle/rk/monitoring/logs'

#------------------------------------------------------------------------------------------------------------------------
# name          : PROACTIVE_CPU_UTILIZATION
# datatype:     : integer
# description   : cpu utilization threshold percentage for proactive alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
PROACTIVE_CPU_UTILIZATION=85

#------------------------------------------------------------------------------------------------------------------------
# name          : CRITICAL_CPU_UTILIZATION
# datatype:     : integer
# description   : cpu utilization threshold percentage for critical alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
CRITICAL_CPU_UTILIZATION=95

#------------------------------------------------------------------------------------------------------------------------
# name          : PROACTIVE_FRA_UTILIZATION
# datatype:     : integer
# description   : fra utilization threshold percentage for proactive alerting ... only if fast recovery area is enabled
# mandatory     : no
#------------------------------------------------------------------------------------------------------------------------
PROACTIVE_FRA_UTILIZATION=85

#------------------------------------------------------------------------------------------------------------------------
# name          : CRITICAL_FRA_UTILIZATION
# datatype:     : integer
# description   : fra utilization threshold percentage for critical alerting. ... only if fast recovery area is enabled
# mandatory     : no
#------------------------------------------------------------------------------------------------------------------------
CRITICAL_FRA_UTILIZATION=95

#------------------------------------------------------------------------------------------------------------------------
# name          : ORACLE_BASE
# datatype:     : string (directory path)
# description   : top-level directory for oracle software installations 
# mandatory     : yes, if ORACLE_BASE is not in .bash_profile
#------------------------------------------------------------------------------------------------------------------------
ORACLE_BASE=/u01/app/oracle

#------------------------------------------------------------------------------------------------------------------------
# name          : ORACLE_HOME
# datatype:     : string (directory path)
# description   : directory where oracle software is installed 
# mandatory     : yes, if ORACLE_HOME is not in .bash_profile
#------------------------------------------------------------------------------------------------------------------------
ORACLE_HOME=${ORACLE_BASE}/19/product/db_home1

#------------------------------------------------------------------------------------------------------------------------
# name          : ORACLE_SID
# datatype:     : string
# description   : unique name identifying the oracle database instance 
# mandatory     : yes, if ORACLE_SID is not in .bash_profile
#------------------------------------------------------------------------------------------------------------------------
ORACLE_SID=mifxxp011

#------------------------------------------------------------------------------------------------------------------------
# name          : ASM_SID
# datatype:     : string
# description   : unique name identifying the asm instance ... applicable only if asm is db storage 
# mandatory     : no
#------------------------------------------------------------------------------------------------------------------------
ASM_SID=+ASM1

#------------------------------------------------------------------------------------------------------------------------
# name          : LISTENER_NAME
# datatype:     : string
# description   : name of the oracle net listener
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
LISTENER_NAME=LISTENER

#------------------------------------------------------------------------------------------------------------------------
# name          : PROACTIVE_MOUNTPOINT_UTILIZATION
# datatype:     : integer
# description   : mountpoint utilization threshold percentage for proactive alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
PROACTIVE_MOUNTPOINT_UTILIZATION=85

#------------------------------------------------------------------------------------------------------------------------
# name          : CRITICAL_MOUNTPOINT_UTILIZATION
# datatype:     : integer
# description   : mountpoint utilization threshold percentage for critical alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
CRITICAL_MOUNTPOINT_UTILIZATION=95

#------------------------------------------------------------------------------------------------------------------------
# name          : IGNORE_MOUNTPOINT
# datatype:     : string
# description   : comma-separated list of mountpoints to exclude from monitoring
# mandatory     : no
#------------------------------------------------------------------------------------------------------------------------
IGNORE_MOUNTPOINT=/dev,/dev/shm,/run

#------------------------------------------------------------------------------------------------------------------------
# name          : PROACTIVE_TABLESPACE_UTILIZATION
# datatype:     : integer
# description   : tablespace utilization threshold percentage for proactive alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
PROACTIVE_TABLESPACE_UTILIZATION=85

#------------------------------------------------------------------------------------------------------------------------
# name          : CRITICAL_TABLESPACE_UTILIZATION
# datatype:     : integer
# description   : tablespace utilization threshold percentage for critical alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
CRITICAL_TABLESPACE_UTILIZATION=95

#------------------------------------------------------------------------------------------------------------------------
# name          : PROACTIVE_ASM_DISK_UTILIZATION
# datatype:     : integer
# description   : asm diskgroup utilization threshold percentage for proactive alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
PROACTIVE_ASM_DISK_UTILIZATION=85

#------------------------------------------------------------------------------------------------------------------------
# name          : CRITICAL_ASM_DISK_UTILIZATION
# datatype:     : integer
# description   : asm diskgroup utilization threshold percentage for critical alerting
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
CRITICAL_ASM_DISK_UTILIZATION=95

#------------------------------------------------------------------------------------------------------------------------
# name          : DBA_EMAIL
# datatype:     : string 
# description   : comma-separated list of email addresses for general alerts
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
DBA_EMAIL='richard@rkkoranteng.com'

#------------------------------------------------------------------------------------------------------------------------
# name          : INCIDENT_NOTIF_EMAIL
# datatype:     : string 
# description   : comma-separated list of email addresses for incident notification (critical alerts)
# mandatory     : yes
#------------------------------------------------------------------------------------------------------------------------
INCIDENT_NOTIF_EMAIL='richard@koranteng.com.opsgenie.net'

# oracle enterprise manager 
OMS_HOME=/u01/app/oracle/em24/Middleware/oms_home
AGENT_HOME=/u01/app/oracle/em24/agent/agent_24.1.0.0.0

# dynamically pick up ORACLE_SID 
#ORACLE_SID=`ps -ef | grep smon | grep -v '+ASM' | grep -v grep | grep ora_smon | awk '{print $8}' | sed 's/_/ /g' | awk '{print $3}'`
#ASM_SID=`ps -ef | grep smon | grep -v '+ora' | grep -v grep | grep -e '+ASM' | awk '{print $8}' | sed 's/_/ /g' | awk '{print $3}'`
