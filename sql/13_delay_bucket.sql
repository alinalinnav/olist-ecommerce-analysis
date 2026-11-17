q("""
SELECT CASE 
         WHEN julianday(o.order_delivered_customer_date) - julianday(o.order_estimated_delivery_date) <=0 THEN '0. Вовремя'
         WHEN julianday(o.order_delivered_customer_date) - julianday(o.order_estimated_delivery_date) <=3 THEN '1. До 3 дней'
         WHEN julianday(o.order_delivered_customer_date) - julianday(o.order_estimated_delivery_date) <=7 THEN '2. До 7 дней'
         ELSE '3. Больше 7 дней'
       END AS delay_bucket,
       COUNT(*) AS reviews,
       ROUND(AVG(r.review_score), 2) AS avg_score
FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL
GROUP BY delay_bucket
ORDER BY delay_bucket;
""")