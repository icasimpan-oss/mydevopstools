#!/bin/bash
 
cleanup()
# example cleanup function
{
  rm -f /tmp/tempfile
  return $?
}


## NOTE: if you customize control_c function,
## (meaning, without 'exit') you effectively
## ignore CTRL+C in your script 
control_c()
# run if user hits control-c
{
  echo -en "\n*** Ouch! Exiting ***\n"
  cleanup
  exit $?
}
 
# trap keyboard interrupt (control-c)
trap control_c SIGINT
 
# main() loop
while true; do echo 'hey'; done
