# Stock Market Data Fetcher

A simple Python application that retrieves daily stock market data from the **Alpha Vantage API** and exports it to a CSV file for further analysis.

## Features

* Fetches daily stock price data for any valid stock symbol.
* Uses the Alpha Vantage REST API.
* Saves historical daily stock data to a CSV file.
* Automatically formats the output with:

  * Date
  * Open Price
  * High Price
  * Low Price
  * Close Price
  * Trading Volume
* Simple command-line interface.

## Requirements

* Python 3.8+
* Alpha Vantage API Key

## Dependencies

Install the required package:

```bash
pip install requests
```

The following Python modules are used:

* `requests`
* `csv` (built-in)
* `smAPIkey` (local module containing your API key)

## Project Structure

```text
project/
│
├── stock_fetcher.py
├── smAPIkey.py
├── README.md
└── AAPL_stock_data.csv   # Generated after execution
```

## Setting Up the API Key

Create a file named:

```text
smAPIkey.py
```

Inside it, add your Alpha Vantage API key:

```python
key = "YOUR_ALPHA_VANTAGE_API_KEY"
```

You can obtain a free API key from:

[https://www.alphavantage.co/support/#api-key](https://www.alphavantage.co/support/#api-key)

## Usage

Run the script:

```bash
python stock_fetcher.py
```

When prompted, enter a stock symbol:

```text
Enter stock symbol : AAPL
```

Example:

```text
Enter stock symbol : MSFT
```

The program will download the available daily stock data and generate:

```text
MSFT_stock_data.csv
```

## Output CSV Format

| Date       | Open   | High   | Low    | Close  | Volume   |
| ---------- | ------ | ------ | ------ | ------ | -------- |
| 2025-01-15 | 424.53 | 428.90 | 421.70 | 426.31 | 23841234 |

## How It Works

1. Prompts the user for a stock ticker symbol.
2. Converts the symbol to uppercase.
3. Sends a request to the Alpha Vantage **TIME_SERIES_DAILY** endpoint.
4. Parses the JSON response.
5. Extracts the daily time series data.
6. Writes the results into a CSV file named:

```text
<STOCK_SYMBOL>_stock_data.csv
```

## Example

Input:

```text
Enter stock symbol : TSLA
```

Output:

```text
CSV file created for TSLA stock.
```

Generated file:

```text
TSLA_stock_data.csv
```

## Notes

* A valid Alpha Vantage API key is required.
* Free API keys are subject to request rate limits.
* The script assumes the API returns valid daily time series data. Invalid stock symbols or exceeded API limits may result in API error responses.
* Internet connectivity is required.

## Possible Improvements

* Add exception handling for network and API errors.
* Validate user input.
* Support additional Alpha Vantage endpoints (Intraday, Weekly, Monthly).
* Allow users to specify an output directory.
* Export data to Excel (`.xlsx`).
* Visualize stock prices using Matplotlib.
* Add command-line arguments instead of interactive input.
* Implement retry logic for API rate limits.
* Log errors and execution details.

## License

This project is open source and available under the MIT License.

## Acknowledgements

* Alpha Vantage API for providing free stock market data.
* Python Requests library for HTTP communication.
