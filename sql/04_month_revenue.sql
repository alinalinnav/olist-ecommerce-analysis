SELECT strftime('%Y-%m', orders.order_purchase_timestamp) AS month,
       COUNT(DISTINCT orders.order_id) AS orders,
       ROUND(SUM(order_items.price),2) AS revenue
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
WHERE orders.order_status = 'delivered'
GROUP BY month
ORDER BY month;