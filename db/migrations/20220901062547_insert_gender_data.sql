-- migrate:up
INSERT INTO 
gender (name) 
VALUES 
('UNISEX'), ('MALE'), ('FEMALE')

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE gender;
SET FOREIGN_KEY_CHECKS = 1;
