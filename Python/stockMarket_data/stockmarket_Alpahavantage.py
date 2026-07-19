import requests
import csv
import smAPIkey


API_KEY=smAPIkey.key
funct="TIME_SERIES_DAILY"
symbl_input=input("Enter stock symbol : ")
symbl= symbl_input.upper()

#queries_old=queries= f"query?function={funct}&symbol={symbl}&interval={int_time}&apikey={key}"

def stock_mrkt_data(symbl):
    api_url = "https://www.alphavantage.co/"
    queries= (f"query?function={funct}&symbol={symbl}&apikey={API_KEY}")
    final_url=(api_url+queries)
    response = requests.get(final_url)

    # print(r.status_code)
    # print(r.headers["Content-Type"])

    data = response.json()
    # print(data)
    for key,value in data.items():
        if key == "Time Series (Daily)":
            continue
        else:
            print(key,value)

    time_series = data["Time Series (Daily)"]

    with open(f"{symbl}_stock_data.csv", "w", newline="") as file:

        writer = csv.writer(file)

        writer.writerow([
            "Date",
            "Open",
            "High",
            "Low",
            "Close",
            "Volume"
        ])

        for date, values in time_series.items():
            writer.writerow([
                date,
                values["1. open"],
                values["2. high"],
                values["3. low"],
                values["4. close"],
                values["5. volume"]
            ])

    print(f"CSV file created for {symbl} stock.")


stock_mrkt_data(symbl)
exit()