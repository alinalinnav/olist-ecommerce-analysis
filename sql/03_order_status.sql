SELECT order_status, COUNT(*) AS cnt
FROM orders
GROUP BY order_status
ORDER BY cnt DESC;
