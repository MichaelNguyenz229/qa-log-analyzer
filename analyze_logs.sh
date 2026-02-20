#!/bin/bash

# ============================================
# QA Log Analyzer
# Author: Michael Nguyen
# Description: Analyzes infotainment app logs,
# categorizes entries, and outputs a summary
# ============================================

# --- Configuration ---
LOG_FILE="sample.log"
OUTPUT_DIR="output"
ERROR_FILE="$OUTPUT_DIR/errors.log"
SUMMARY_FILE="$OUTPUT_DIR/summary.txt"

# --- Setup ---
mkdir -p $OUTPUT_DIR

echo "================================"
echo "   QA Log Analyzer"
echo "   Analyzing: $LOG_FILE"
echo "================================"
echo ""

# --- Check if log file exists ---
if [ ! -f "$LOG_FILE" ]; then
    echo "ERROR: Log file '$LOG_FILE' not found."
    exit 1
fi

echo "Log file found. Starting analysis..."

# --- Extract log levels ---
echo ''
echo 'Extracting log entries by level...'
echo ''

ERRORS=$(grep "ERROR" $LOG_FILE)
WARNINGS=$(grep "WARNING" $LOG_FILE)
INFOS=$(grep "INFO" $LOG_FILE)

# --- Count each level ---
ERROR_COUNT=$(grep -c "ERROR" $LOG_FILE)
WARNING_COUNT=$(grep -c "WARNING" $LOG_FILE)
INFO_COUNT=$(grep -c "INFO" $LOG_FILE)

# --- Display counts ---
echo "ERROR count: $ERROR_COUNT"
echo "WARNING count: $WARNING_COUNT"
echo "INFO count: $INFO_COUNT"

# --- Save errors to seperate file ---
echo "$ERRORS" > $ERROR_FILE
echo ""
echo "Errors saved to $ERROR_FILE"
