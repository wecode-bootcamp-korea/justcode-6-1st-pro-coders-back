-- migrate:up
INSERT INTO 
color (name) 
VALUES 
('BEIGE'), ('BLACK'), ('BLUE'), ('GRAY'), ('GREEN'), 
('LIME'), ('NAVY'), ('ORANGE'), ('PINK'), ('RED'), 
('WHITE'), ('YELLOW')

-- migrate:down

TRUNCATE color