-- migrate:up
INSERT INTO 
type (name) 
VALUES 
('SHOES'), ('WEAR'), ('OTHERS')

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE type;
SET FOREIGN_KEY_CHECKS = 1;
