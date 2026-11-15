SELECT COUNT(*) AS orders_count,
       COUNT(DISTINCT customer_id) AS customer_ids,
       (SELECT COUNT(DISTINCT customer_unique_id) FROM customers) AS unique_customers_count
FROM orders;