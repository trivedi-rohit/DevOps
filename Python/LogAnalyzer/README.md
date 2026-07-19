Here's a polished `README.md` suitable for a GitHub repository.

# Log Analyzer

Here's a more detailed and professional **Log Analyzer** section that you can place near the top of your `README.md`.

# Log Analyzer

The **Log Analyzer** is a lightweight Python application designed to automate the analysis of application log files by identifying and counting log messages based on their severity level. Instead of manually scanning potentially thousands of log entries, this tool processes each log file line by line, categorizes messages into predefined log levels (`INFO`, `WARNING`, and `ERROR`), and generates a structured JSON report containing the total count for each category.

This project demonstrates the use of **Object-Oriented Programming (OOP)** principles in Python by encapsulating all log-processing functionality within a reusable `LogAnalyzer` class. Each instance of the class is responsible for reading a specific log file, analyzing its contents, and writing the summarized results to a separate JSON output file.

The analyzer follows a simple workflow:

1. Reads all entries from the specified log file.
2. Initializes counters for each supported log level.
3. Iterates through every line in the log file.
4. Detects whether the line contains `INFO`, `WARNING`, or `ERROR`.
5. Increments the corresponding counter.
6. Writes the final statistics to a formatted JSON file for easy consumption by users or other applications.

Because the program accepts the input and output file names when creating a `LogAnalyzer` object, it can easily analyze multiple log files in a single execution without modifying the core logic. This makes the solution reusable, scalable, and easy to extend for larger projects.

The generated JSON reports provide a quick overview of the health of an application. For example:

* A high number of **INFO** messages typically indicates normal application activity.
* **WARNING** messages can highlight potential issues that may require attention before they become critical.
* **ERROR** messages indicate failures or unexpected events that should be investigated.

This project is an excellent beginner-to-intermediate example of working with:

* Object-Oriented Programming (Classes and Objects)
* File handling in Python
* Reading and processing text files
* Dictionary operations
* JSON serialization using Python's built-in `json` module
* Basic data analysis and reporting

## Features

* Reads log files line by line.
* Counts occurrences of:

  * `INFO`
  * `WARNING`
  * `ERROR`
* Writes the log summary to a formatted JSON file.
* Supports analyzing multiple log files by creating multiple instances of the `LogAnalyzer` class.

## Project Structure

```text
.
├── app.log
├── app1.log
├── output1.json
├── output2.json
├── log_analyzer.py
└── README.md
```

## Requirements

* Python 3.x

No external libraries are required. The project only uses Python's built-in `json` module.

## How It Works

The `LogAnalyzer` class performs the following tasks:

### 1. Initialize

Creates an analyzer object by providing:

* Input log file
* Output JSON file

```python
log = LogAnalyzer("app.log", "output.json")
```

### 2. Read Log File

The `read_logs()` method opens the specified log file and reads all lines.

```python
lines = self.read_logs()
```

### 3. Analyze Logs

The `analyze_logs()` method:

* Initializes counters for each log level.
* Reads each line of the log file.
* Checks whether the line contains:

  * `INFO`
  * `WARNING`
  * `ERROR`
* Increments the corresponding counter.
* Writes the results to a JSON file.

### 4. Write Results

The `write_json_file()` method saves the counts in JSON format.

Example output:

```json
{
    "INFO": 12,
    "WARNING": 4,
    "ERROR": 2
}
```

## Class Overview

### `LogAnalyzer(file_name, output_file)`

Creates a new log analyzer instance.

| Method                    | Description                                       |
| ------------------------- | ------------------------------------------------- |
| `read_logs()`             | Reads all lines from the log file.                |
| `analyze_logs()`          | Counts log levels and writes the results to JSON. |
| `write_json_file(counts)` | Saves the counts to the output JSON file.         |
| `print_log(counts)`       | Prints the log counts to the console.             |

## Example Usage

```python
log1 = LogAnalyzer("app.log", "output1.json")
logs_count = log1.analyze_logs()

log2 = LogAnalyzer("app1.log", "output2.json")
logs_count = log2.analyze_logs()
```

## Sample Input

Example log file:

```text
INFO Application started
INFO User logged in
WARNING Low disk space
ERROR Database connection failed
INFO Request completed
```

## Sample Output

```json
{
    "INFO": 3,
    "WARNING": 1,
    "ERROR": 1
}
```

## Notes

* The analyzer searches for the keywords `INFO`, `WARNING`, and `ERROR` anywhere in each line.
* Lines without these keywords are ignored.
* The JSON output is formatted with indentation for readability.
* Each `LogAnalyzer` instance processes one input file and generates one output file.

## Possible Improvements

* Support additional log levels such as `DEBUG` and `CRITICAL`.
* Use regular expressions for more accurate log parsing.
* Handle missing or invalid files with exception handling.
* Display results in a table or chart.
* Add command-line arguments using `argparse`.
* Include unit tests using `unittest` or `pytest`.
* Process very large log files using generators for improved memory efficiency.

## License

This project is available for educational and learning purposes.
