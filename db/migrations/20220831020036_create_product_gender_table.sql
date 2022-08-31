-- migrate:up
CREATE TABLE product_gender (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  gender_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products (id),
  FOREIGN KEY (gender_id) REFERENCES gender (id)
)
-- migrate:down

DROP TABLE product_gender;
