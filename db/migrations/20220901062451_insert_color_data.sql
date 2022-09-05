-- migrate:up
INSERT INTO 
color (name) 
VALUES 
('BEIGE'), ('BLACK'), ('BLUE'), ('GRAY'), ('GREEN'), 
('LIME'), ('NAVY'), ('ORANGE'), ('PINK'), ('RED'), 
('WHITE'), ('YELLOW')

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE color;
SET FOREIGN_KEY_CHECKS = 1;