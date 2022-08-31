-- migrate:up
CREATE TABLE subcategory (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR (300) NOT NULL
)

-- migrate:down

DROP TABLE subcategory;
