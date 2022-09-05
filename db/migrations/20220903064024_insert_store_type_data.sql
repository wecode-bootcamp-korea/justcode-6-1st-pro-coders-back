-- migrate:up
INSERT INTO store_type (type) VALUE ("직영점"), ("백화점"), ("대리점")

-- migrate:down
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE store_type;
SET FOREIGN_KEY_CHECKS = 1;
