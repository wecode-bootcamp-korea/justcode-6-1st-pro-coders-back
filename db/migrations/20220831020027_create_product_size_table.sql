-- migrate:up
CREATE TABLE product_size (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  size_id INT NOT NULL,
  stock INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (id),
  FOREIGN KEY (size_id) REFERENCES size (id)
)
-- migrate:down

DROP TABLE product_size;
