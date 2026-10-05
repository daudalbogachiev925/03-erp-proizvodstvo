SELECT p.id, p.name,
       SUM(b.qty * c.unit_cost) AS material_cost,
       SUM(r.hours * wc.rate_per_hour) AS labor_cost
FROM products p
LEFT JOIN bom b ON b.parent_id = p.id
LEFT JOIN components c ON c.id = b.component_id
LEFT JOIN routes r ON r.product_id = p.id
LEFT JOIN work_centers wc ON wc.id = r.wc_id
GROUP BY p.id;
