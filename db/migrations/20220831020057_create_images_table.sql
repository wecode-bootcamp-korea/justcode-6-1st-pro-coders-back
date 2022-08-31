-- migrate:up
CREATE TABLE images (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  source VARCHAR(3000) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (id)
)
-- migrate:down

DROP TABLE images;
