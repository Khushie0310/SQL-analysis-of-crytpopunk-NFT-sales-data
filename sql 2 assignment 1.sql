1. Total Sales Count
  SELECT COUNT(*) AS total_sales
   FROM Cryptopunk_Sales;

2. Top 5 Most Expensive Transactions (by USD Price)
   SELECT NFT_name, ETH_price, USD_price, sale_date
   FROM Cryptopunk_Sales
   ORDER BY USD_price DESC
   LIMIT 5;

3. Transaction Price Moving Average (50-Transaction Window)
  SELECT transaction_id, USD_price,
       AVG(USD_price) OVER (ORDER BY transaction_id ROWS BETWEEN 49 PRECEDING AND CURRENT ROW) AS moving_average_USD
   FROM Cryptopunk_Sales;

4. Average Price by NFT Name 
  SELECT NFT_name, AVG(USD_price) AS average_price
   FROM Cryptopunk_Sales
   GROUP BY NFT_name
   ORDER BY average_price DESC;

5.Weekly Sales Summary (Count and Average ETH Price) 
  SELECT DAYNAME(sale_date) AS day_of_week,
       COUNT(*) AS sales_count,
       AVG(ETH_price) AS average_ETH_price
  FROM Cryptopunk_Sales
  GROUP BY day_of_week
  ORDER BY sales_count ASC;

6. Detailed Sale Summary (Descriptive Column) 
   SELECT CONCAT(NFT_name, ' was sold for $', ROUND(USD_price, 0), ' to ', buyer_address,
              ' from ', seller_address, ' on ', sale_date) AS summary
   FROM Cryptopunk_Sales;

7. Purchases View for Wallet 0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685
   CREATE VIEW 1919_purchases AS
   SELECT *
   FROM Cryptopunk_Sales
   WHERE buyer_address = '0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685';

8. ETH Price Histogram (Rounded to Nearest Hundred)
   SELECT ROUND(ETH_price, -2) AS ETH_price_range, COUNT(*) AS transaction_count
   FROM Cryptopunk_Sales
   GROUP BY ETH_price_range
   ORDER BY ETH_price_range;

9. Highest and Lowest Price Comparison for Each NFT
   SELECT NFT_name, MAX(USD_price) AS price, 'highest' AS status
   FROM Cryptopunk_Sales
   GROUP BY NFT_name

  UNION ALL

  SELECT NFT_name, MIN(USD_price) AS price, 'lowest' AS status
  FROM Cryptopunk_Sales
  GROUP BY NFT_name
  ORDER BY NFT_name, status;

10.Monthly Top-Selling NFT
   SELECT DATE_FORMAT (date, '%Y-%m') AS month_year,
       NFT_name, MAX(USD_price) AS highest_price
   FROM Cryptopunk_Sales
   GROUP BY month_year, NFT_name
   ORDER BY month_year;

11. Monthly Sales Volume (Sum of USD Prices)
  SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month_year,
       ROUND(SUM(USD_price), -2) AS monthly_sales_volume
   FROM Cryptopunk_Sales
   GROUP BY month_year;

12. Transaction Count for Wallet
    SELECT COUNT(*) AS transaction_count
    FROM Cryptopunk_Sales
    WHERE buyer_address = '0x1919db36ca2fa2e15f9000fd9cdc2edcf863e685';

13. Estimated Daily Average Value (Excluding Outliers) 
    Part A: Daily Averages with Window Function (Subquery)
    WITH daily_averages AS (
    SELECT sale_date,
           USD_price,
           AVG(USD_price) OVER (PARTITION BY sale_date) AS daily_avg_USD
    FROM Cryptopunk_Sales
    )

   SELECT * FROM daily_averages;

   Part B: Filter Outliers and Calculate Adjusted Daily Average
     
   WITH daily_averages AS (
    SELECT sale_date,
           USD_price,
           AVG(USD_price) OVER (PARTITION BY sale_date) AS daily_avg_USD
    FROM Cryptopunk_Sales
   ),
  filtered_data AS (
    SELECT sale_date, USD_price
    FROM daily_averages
    WHERE USD_price >= 0.1 * daily_avg_USD
 )

 SELECT sale_date, AVG(USD_price) AS estimated_daily_value
  FROM filtered_data
  GROUP BY sale_date;




