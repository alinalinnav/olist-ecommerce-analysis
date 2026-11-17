SELECT COALESCE(t.product_category_name, t.product_category_name_english) AS category,
       COUNT(DISTINCT r.order_id) AS orders,
       ROUND(AVG(r.review_score), 2) AS avg_score
FROM order_reviews r
JOIN order_items oi ON r.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation t
       ON p.product_category_name = t.product_category_name
GROUP BY category
HAVING COUNT(DISTINCT r.order_id) >=100
ORDER BY avg_score
LIMIT 10;