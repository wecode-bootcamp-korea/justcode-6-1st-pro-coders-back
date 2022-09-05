-- migrate:up
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE VIEW search_base AS
(SELECT 
p.id as id,
k.name as keyword,
p.title as title,
p.product_code as product_code,
i.contents as contents,
i.material as material,
g.name as gender,
c.name as category_name,
s.name as subcategory_name
FROM
products AS p
LEFT JOIN keyword AS k ON p.keyword_id = k.id 
LEFT JOIN information AS i ON p.id = i.product_id 
LEFT JOIN gender AS g ON p.gender_id = g.id
LEFT JOIN category AS c ON p.category_id = c.id
LEFT JOIN subcategory AS s ON p.subcategory_id = s.id
GROUP BY p.id, p.title
)

-- migrate:down

DROP VIEW search_base