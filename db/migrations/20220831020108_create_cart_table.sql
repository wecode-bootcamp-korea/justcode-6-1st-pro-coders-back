-- migrate:up
CREATE TABLE cart (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  size_id INT NOT NULL,
  count INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (product_id) REFERENCES products (id),
  FOREIGN KEY (size_id) REFERENCES size (id)
)
-- migrate:down

DROP TABLE cart;