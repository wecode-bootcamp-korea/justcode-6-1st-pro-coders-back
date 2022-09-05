-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


CREATE VIEW product_data_for_cart AS 
SELECT 
ps.id AS id,
p.title AS title,
c.name AS color,
s.name AS size,
p.discounted_price AS price
FROM
product_size AS ps
LEFT JOIN products AS p ON ps.product_id = p.id
LEFT JOIN size AS s ON ps.size_id = s.id
LEFT JOIN color AS c ON p.color_id = c.id


-- migrate:down

DROP VIEW product_data_for_cart