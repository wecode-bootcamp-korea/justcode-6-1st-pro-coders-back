-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


CREATE VIEW product_summary AS 
SELECT 
products.id as id,
type.name AS type,
category.name AS category,
keyword.name as keyword,
products.title as title,
products.is_discounted as is_discounted,
products.discount_percent as discount_percent,
products.discounted_price as discounted_price,
products.main_image as main_image,
products.sub_image as sub_image,
gender.name as gender
FROM
products
LEFT JOIN keyword ON products.keyword_id = keyword.id 
LEFT JOIN gender ON products.gender_id = gender.id 
LEFT JOIN type ON products.type_id = type.id 
LEFT JOIN category ON products.category_id = category.id

-- migrate:down

DROP VIEW product_summary