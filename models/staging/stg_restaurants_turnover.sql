SELECT O.RESTAURANT_IDENTIFIER, R.NAME, R.ADDRESS, SUM(AMOUNT) as TURNOVER 
FROM {{ref('base_orders')}} as O 
JOIN {{ref('base_restaurants')}} as R 
ON O.RESTAURANT_IDENTIFIER = R.RESTAURANT_IDENTIFIER 
GROUP BY O.RESTAURANT_IDENTIFIER, R.NAME, R.ADDRESS