-- tests/my_integration_test.sql
SELECT *
FROM {{ ref('turnover') }}
WHERE RESTAURANT_IDENTIFIER > 0