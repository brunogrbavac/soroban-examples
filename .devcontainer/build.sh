#!/bin/bash

# Create log directory
mkdir -p /home/dev/logs

# Clear previous log if it exists
echo "Starting build at $(date)" > /home/dev/logs/make.log

# Running in background with proper logging
cd /workspaces/soroban-examples && \
nohup bash -c "make all 2>&1 | tee -a /home/dev/logs/make.log" > /dev/null 2>&1 &

# Save the process ID
echo $! > /home/dev/logs/build.pid

echo "Build process started with PID $(cat /home/dev/logs/build.pid)"
echo "Monitor with: tail -f /home/dev/logs/make.log"

# Test output to verify logging
sleep 1
echo "If you see this message in the log, logging is working correctly." >> /home/dev/logs/make.log