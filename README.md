# QA Log Analyzer

A bash tool for ingesting and analyzing application log files from embedded systems and infotainment platforms. Built as a portfolio project for learning fundamental QA practices.

## What it does

- Accepts any log file as input via command line argument
- Extracts and categorizes ERROR, WARNING, and INFO entries using grep
- Counts each log level and calculates total line count
- Saves errors and warnings to separate files for triage
- Generates a clean dated summary report

## Usage
```bash
# Analyze default sample log
./analyze_logs.sh

# Analyze any log file
./analyze_logs.sh your_log_file.log
```

## Output

Running the script produces three files in the `output/` directory:

| File | Contents |
|------|----------|
| `errors.log` | All ERROR level entries |
| `warnings.log` | All WARNING level entries |
| `summary.txt` | Full analysis report with counts and timestamp |

## Sample Output
```
================================
   QA Log Analyzer
   Analyzing: sample.log
================================

Log file found. Starting analysis...

Extracting log entries by level...

ERROR count:    4
WARNING count:  3
INFO count:     12

Errors saved to output/errors.log
Warnings saved to: output/warnings.log

Generating summary report...
Summary saved to: output/summary.txt

================================
   Analysis Complete
================================
```

## Sample Log Data

Includes realistic MCU2/Tegra X2 infotainment log data covering:
- CAN bus frame drop detection
- Audio DSP pipeline failures  
- UI render thread watchdog timeouts
- Rear camera MIPI CSI-2 lane errors
- GPS signal degradation with HDOP metrics
- Thermal throttling events

## Tech

- Bash scripting
- grep, cat, echo, date
- Heredoc for formatted file generation
- Command line argument handling with default fallback
- Designed for Linux/macOS terminal

## Author

Michael Nguyen