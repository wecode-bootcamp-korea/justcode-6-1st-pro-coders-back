-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE VIEW image_arr_by_product AS 
SELECT
p.id as id,
p.main_image as main,
p.sub_image as sub,
JSON_ARRAYAGG(i.source) as more
FROM
products AS p JOIN images AS i 
ON p.id = i.product_id
GROUP BY product_id


-- migrate:down

DROP VIEW image_arr_by_product