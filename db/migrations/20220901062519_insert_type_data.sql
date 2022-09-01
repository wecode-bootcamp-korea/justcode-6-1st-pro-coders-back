-- migrate:up
INSERT INTO 
type (name) 
VALUES 
('SHOES'), ('WEAR'), ('OTHERS')

-- migrate:down

TRUNCATE type