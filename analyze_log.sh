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
