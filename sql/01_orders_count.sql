SELECT COUNT(*) AS orders,
COUNT (DISTINCT customer_id) AS customers
FROM orders;