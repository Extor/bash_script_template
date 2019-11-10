#!/usr/bin/env bash

# Author:  Alexey <extor> Egorychev <me@jnotes.ru>
# License:  GPLv3

# DESCRIPTION
# Script for doing something
#
# REQUIREMENTS
#   - curl
# 
# USAGE EXAMPLE
#   example.sh /dir/path

###############################################################################
# USAGE

SCRIPT_PREFIX="extor_"
SCRIPT_NAME="example.sh"
SCRIPT_ARGS=""
SCRIPT_USAGE=""
LOGFILE=${LOGFILE:-/var/log/${SCRIPT_PREFIX}${SCRIPT_NAME}.log}

###############################################################################
# SETTINGS

TEST_VAR="root"

###############################################################################
# HELPER METHODS

log() {
  local logfile="${1}"
  local message="${2}"

  local date=$(date '+%d-%m-%Y %H:%M:%S')
  echo "[${date}] ${message}" >> ${logfile}
}

usage() {
  echo "$0 ${SCRIPT_ARGS}"
  echo "${SCRIPT_USAGE}"
  exit 1
}

checkresult() {
  if [ $? -ne 0 ]; then
    echo "ERROR: Something wrong ..."
    exit 1
  fi
}

###############################################################################
# CURRENT METHODS

do_something_function(){
    echo "Do something with ${TEST_VAR} ..."

###############################################################################
# MAIN METHOD

main() {

    log ${LOGFILE} "Script started"

    # check arguments
    if [[ $# -ne 1 ]]; then
      usage
    fi

    do_something_function

    log ${LOGFILE} "Script done"

}

###############################################################################

main "$@"
