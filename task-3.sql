SELECT products.product_name, SUM(order_details.product_id) AS sum
FROM products
INNER JOIN order_details
ON products.product_id = order_details.product_id
GROUP BY products.product_name
ORDER BY sum
LIMIT 10;
