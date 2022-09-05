-- migrate:up
INSERT INTO 
size (name) 
VALUES 
('190'), ('200'), ('210'), ('220'), ('230'), 
('240'), ('250'), ('260'), ('270'), ('280'), 
('FREE')

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE size;
SET FOREIGN_KEY_CHECKS = 1;

