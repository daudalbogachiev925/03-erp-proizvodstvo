CREATE TABLE products (id SERIAL PRIMARY KEY, sku TEXT, name TEXT, kind TEXT);
CREATE TABLE bom (parent_id INT, component_id INT, qty NUMERIC,
    PRIMARY KEY (parent_id, component_id));
CREATE TABLE work_centers (id SERIAL PRIMARY KEY, name TEXT, capacity_per_hour NUMERIC);
CREATE TABLE routes (product_id INT, step INT, wc_id INT, hours NUMERIC,
    PRIMARY KEY (product_id, step));
