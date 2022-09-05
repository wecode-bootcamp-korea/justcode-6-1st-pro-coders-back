-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


CREATE VIEW product_summary AS 
SELECT 
products.id AS id,
type.name AS type,
category.name AS category,
keyword.name AS keyword,
products.title AS title,
products.price_c AS price,
products.is_discounted AS is_discounted,
products.discount_percent AS discount_percent,
products.discounted_price_c AS discounted_price,
products.main_image AS main_image,
products.sub_image AS sub_image,
gender.name AS gender
FROM
products
LEFT JOIN keyword ON products.keyword_id = keyword.id 
LEFT JOIN gender ON products.gender_id = gender.id 
LEFT JOIN type ON products.type_id = type.id 
LEFT JOIN category ON products.category_id = category.id

-- migrate:down

DROP VIEW product_summary