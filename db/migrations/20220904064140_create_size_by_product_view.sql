-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE VIEW size_by_product AS 
SELECT 
products.id as id,
size.name as size
FROM
products 
LEFT JOIN product_size ON products.id = product_size.product_id 
LEFT JOIN size ON product_size.size_id = size.id

-- migrate:down

DROP VIEW size_by_product