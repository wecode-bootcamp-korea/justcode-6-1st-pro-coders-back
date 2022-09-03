-- migrate:up
CREATE TABLE store_type (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
type VARCHAR (30)
)

-- migrate:down

DROP TABLE store_type