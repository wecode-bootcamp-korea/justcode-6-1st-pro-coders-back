-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


CREATE VIEW product_detail AS 
SELECT 
products.id as id,
keyword.name as keyword,
products.title as title,
product_code as product_code,
products.price_c AS price,
products.is_discounted as is_discounted,
products.discount_percent as discount_percent,
products.discounted_price_c as discounted_price,
products.main_image as main_image,
products.sub_image as sub_image,
products.back_image as back_image,
products.high_image as high_image,
information.contents as contents,
information.material as material,
information.sizes as sizes,
information.manufacturer as manufacturer,
information.country_of_manufacture as country_of_manufacture,
information.caution as caution,
information.guarantee as guarantee,
information.service_information as service_information,
gender.name as gender,
subcategory.name as subcategory_items,
JSON_ARRAYAGG(images.source) as images
FROM
products 
LEFT JOIN keyword ON products.keyword_id = keyword.id 
LEFT JOIN information ON products.id = information.product_id 
LEFT JOIN gender ON products.gender_id = gender.id
LEFT JOIN subcategory ON products.subcategory_id = subcategory.id
LEFT JOIN images ON products.id = images.product_id
GROUP BY products.id

-- migrate:down

DROP VIEW product_detail