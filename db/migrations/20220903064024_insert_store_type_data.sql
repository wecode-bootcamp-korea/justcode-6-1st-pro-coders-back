-- migrate:up
INSERT INTO store_type (type) VALUE ("직영점"), ("백화점"), ("대리점")

-- migrate:down

TRUNCATE store_type