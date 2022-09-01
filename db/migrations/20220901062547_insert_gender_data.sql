-- migrate:up
INSERT INTO 
gender (name) 
VALUES 
('UNISEX'), ('MALE'), ('FEMALE')

-- migrate:down

TRUNCATE gender