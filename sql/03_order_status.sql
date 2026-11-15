SELECT order_status,
       COUNT(*) AS orders_count,
       ROUND(COUNT(*)/(SELECT COUNT(*) FROM orders), 2) as percent
FROM orders
GROUP BY order_status
ORDER BY orders_count DESC;