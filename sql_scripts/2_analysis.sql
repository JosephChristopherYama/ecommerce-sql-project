SELECT
    trans.product_category_name_english AS category,
    COUNT(items.order_id) AS total_orders
FROM
    order_items AS items
LEFT JOIN
    products AS prod ON items.product_id = prod.product_id
LEFT JOIN
    product_category_name_translation AS trans ON prod.product_category_name = trans.product_category_name
WHERE
    trans.product_category_name_english IS NOT NULL
GROUP BY
    category
ORDER BY
    total_orders DESC
LIMIT 10;

SELECT
    payment_type,
    COUNT(*) AS total_uses
FROM
    order_payments
GROUP BY
    payment_type
ORDER BY
    total_uses DESC;

SELECT
    cust.customer_state,
    COUNT(DISTINCT cust.customer_unique_id) AS total_customers
FROM
    customers AS cust
GROUP BY
    cust.customer_state
ORDER BY
    total_customers DESC
LIMIT 10;
