SELECT c.company_name AS company_name,
       COUNT(o.customer_id) AS orders,
       STRING_AGG(TO_CHAR(o.order_id, '99999'), ',') AS order_ids
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE c.country LIKE 'USA' AND
      o.customer_id IN (SELECT customer_id
                        FROM orders
                        GROUP BY customer_id HAVING COUNT(*) < 5)
GROUP BY company_name
ORDER BY orders;
