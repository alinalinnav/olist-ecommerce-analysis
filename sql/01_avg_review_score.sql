SELECT ROUND(AVG(review_score),2) AS avg_score, COUNT(*) AS reviews
FROM order_reviews;