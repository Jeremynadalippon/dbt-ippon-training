
WITH sales_data AS (
   SELECT RESTAURANT_IDENTIFIER, SUM(AMOUNT) AS total
   FROM {{mockable_source("jaffle_shop", "ORDERS")}}
   GROUP BY RESTAURANT_IDENTIFIER
)

SELECT RESTAURANT_IDENTIFIER, total
FROM sales_data
WHERE total > 0