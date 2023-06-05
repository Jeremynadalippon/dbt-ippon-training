WITH sales_data AS (
   SELECT name, SUM(nb_employees) AS total_quantity
   FROM {{ref("restaurants")}}
   GROUP BY name
)

SELECT name, total_quantity
FROM sales_data
WHERE total_quantity > 5