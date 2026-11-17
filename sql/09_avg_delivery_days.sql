SELECT ROUND(AVG(julianday(order_delivered_customer_date)-
               julianday(order_purchase_timestamp)), 1) AS avg_days
FROM orders
WHERE order_status = 'delivered' 
  AND order_delivered_customer_date IS NOT NULL;