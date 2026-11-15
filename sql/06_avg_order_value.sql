SELECT ROUND(SUM(oi.price)/COUNT(oi.order_id)) AS avg_order_value
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';