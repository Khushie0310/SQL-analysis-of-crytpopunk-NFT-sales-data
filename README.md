NFT Sales Data Analysis
This project contains SQL queries designed to analyze transaction data from the Cryptopunks NFT project. The dataset includes sales records from January 1, 2018, to December 31, 2021, with each row representing a sale of a Cryptopunk NFT. The SQL queries offer insights into transaction counts, high-value sales, moving averages, price distribution, and more.

Project Structure
nft_analysis_queries.sql: Contains all SQL queries used in the analysis.
Data Source: The dataset includes columns such as buyer address, ETH price, USD price, seller’s address, date, time, NFT ID, transaction hash, and NFT name.
SQL Queries
The queries are designed to provide insights into various facets of the NFT market, specifically focusing on the Cryptopunks dataset.

1. Total Sales Count
Calculates the total number of sales within the dataset’s date range, providing an overview of the total market activity.

2. Top 5 Most Expensive Transactions
Identifies the five highest-priced transactions based on USD price, showing the NFT name, ETH price, USD price, and transaction date.

3. Transaction Price Moving Average
Returns a table for each transaction with an event column, a USD price column, and a 50-transaction moving average of USD price. This reveals pricing trends over time.

4. Average Price by NFT Name
Lists each unique NFT with its average sale price in USD, ordered from highest to lowest. This helps identify the most valuable NFTs.

5. Weekly Sales Summary
Calculates the number of sales for each day of the week and the average ETH price. Ordered by the count of transactions, it reveals any day-of-week patterns.

6. Detailed Sale Summary
Generates a summary description for each transaction, including the NFT name, buyer, seller, date, and sale price. Example:
“CryptoPunk #1139 was sold for $194,000 to 0xBuyer from 0xSeller on 2022-01-14.”

7. 1919_purchases View
Creates a view to list all transactions where the address 0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685 is the buyer, allowing focused analysis on this wallet.

8. ETH Price Histogram
Generates a histogram of ETH prices for all transactions, rounded to the nearest hundred. This provides a quick view of price distribution.

9. Highest and Lowest Price Comparison
Combines the highest and lowest price for each NFT into one table with a status column ("highest" or "lowest"), enabling price volatility analysis.

10. Monthly Top-Selling NFT
Lists the top-selling NFT each month with its highest USD sale price. Results are ordered chronologically.

11. Monthly Sales Volume
Calculates total sales volume (USD) per month, rounded to the nearest hundred.

13. Transaction Count for Wallet 0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685
Counts the transactions for this specific wallet to analyze buying activity.

15. Estimated Daily Average Value
Excludes outlier transactions to estimate a reliable daily average value for Cryptopunks NFTs.

Prerequisites
MySQL or any SQL-compatible database engine
Access to the Cryptopunks NFT dataset in SQL-compatible format

Import the dataset into your SQL environment.

Run each query in the order provided or as needed based on analysis goals.

Usage
Each query is designed to be run independently, allowing for flexibility in the analysis process. Adjustments to field names may be necessary depending on your dataset structure.
