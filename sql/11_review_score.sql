SELECT review_score,
       COUNT(*) AS reviews,
       ROUND(COUNT(*)*100/(SELECT COUNT(*) FROM order_reviews), 2) AS percent
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;