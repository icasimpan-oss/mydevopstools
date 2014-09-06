#!/bin/bash

all_log="all_log.log"
exec > >(tee -a $all_log) 2>&1

echo "1st line logging"
echo "2nd line logging"
echo "3rd line logging"

echo "Command executed: $0" >> $all_log
echo "1st line after logging"
echo "2nd line after logging"
echo "3rd line after logging"
