#!/bin/bash

# ============================================
# QA Log Analyzer
# Author: Michael Nguyen
# Description: Analyzes infotainment app logs,
# categorizes entries, and outputs a summary
# ============================================

# --- Configuration ---
LOG_FILE="${1:-sample.log}"
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

# --- Save warnings to separate file ---
echo "$WARNINGS" > "$OUTPUT_DIR/warnings.log"
echo "Warnings saved to: $OUTPUT_DIR/warnings.log"

# --- Generate summary report ---
echo ""
echo "Generating summary report..."

cat > $SUMMARY_FILE << EOF
================================
QA LOG ANALYSIS SUMMARY
Analyzed: $LOG_FILE
Date: $(date)
================================

COUNTS:
  ERROR:    $ERROR_COUNT
  WARNING:  $WARNING_COUNT
  INFO:     $INFO_COUNT
  -------------------------
  TOTAL:    $(grep -c "" $LOG_FILE)

TOP ERRORS:
$(grep "ERROR" $LOG_FILE)

================================
EOF

echo "Summary saved to: $SUMMARY_FILE"
echo ""
echo "================================"
echo "   Analysis Complete"
echo "================================"
