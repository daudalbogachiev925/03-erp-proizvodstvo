-- MRP: потребность в компонентах
WITH demand AS (
    SELECT product_id, SUM(qty) AS need_qty
    FROM sales_orders GROUP BY product_id
)
SELECT d.product_id, b.component_id,
       d.need_qty * b.qty AS required
FROM demand d
JOIN bom b ON b.parent_id = d.product_id;
