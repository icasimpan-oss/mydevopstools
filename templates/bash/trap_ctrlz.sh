#!/bin/bash
 
cleanup()
# example cleanup function
{
  rm -f /tmp/tempfile
  return $?
}


control_z()
{
  echo -en "\n*** CTRL-Z ignored. ***\n"
  echo "You need to kill process if you really need to cancel compilation"
  cleanup
  sleep 5
  exit $?
}
 
# trap keyboard interrupt (control-z)
trap control_c SIGTSTP
 
# main() loop
while true; do echo 'hey'; done
