-- migrate:up
CREATE TABLE cart (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  product_size_id INT NOT NULL,
  count INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (product_size_id) REFERENCES product_size(id)
)
-- migrate:down

DROP TABLE cart;