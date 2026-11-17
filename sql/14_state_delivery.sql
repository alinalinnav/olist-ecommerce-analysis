SELECT c.customer_state,
       COUNT(*) AS orders,
       ROUND(AVG(julianday(o.order_delivered_customer_date)
                - julianday(o.order_purchase_timestamp)), 1) AS avg_days,
       ROUND(100*SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
            THEN 1 ELSE 0 END)/COUNT(*), 1) as late_percent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
HAVING COUNT(*) >= 100
ORDER BY avg_days DESC;