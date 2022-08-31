-- migrate:up
CREATE TABLE category (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)

-- migrate:down

DROP TABLE category;
