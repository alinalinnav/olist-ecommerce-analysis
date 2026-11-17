SELECT COUNT(*) AS orders,
       SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date
                THEN 1 ELSE 0 END) AS late_orders,
       ROUND(100*SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date
                          THEN 1 ELSE 0 END)/COUNT(*), 2) AS late_percent
FROM orders
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL;