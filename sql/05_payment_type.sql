SELECT payment_type,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(payment_value),2) AS total_paid
FROM order_payments
GROUP BY payment_type
ORDER BY total_paid DESC;