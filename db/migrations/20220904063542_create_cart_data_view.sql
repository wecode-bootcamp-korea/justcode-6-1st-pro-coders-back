-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


CREATE VIEW cart_data AS 
SELECT 
c.id AS cart_id,
c.user_id AS user_id,
p.title AS title,
p.color AS color,
p.size AS size,
c.count AS count,
p.price AS price,
(p.price * c.count) AS duped_price
FROM
cart AS c
LEFT JOIN product_data_for_cart AS p ON c.product_size_id = p.id

-- migrate:down

DROP VIEW cart_data