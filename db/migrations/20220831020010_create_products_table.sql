-- migrate:up
CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_code VARCHAR(100) UNIQUE NOT NULL,
  title VARCHAR(100) NOT NULL,
  price DECIMAL(7,0) NOT NULL,
  price_c VARCHAR(100) NULL,
  is_discounted TINYINT NOT NULL,
  discount_percent DECIMAL(7,0),
  discounted_price DECIMAL(7,0),
  discounted_price_c VARCHAR(100),
  color_id INT,
  keyword_id INT,
  type_id INT,
  category_id INT,
  subcategory_id INT,
  gender_id INT,
  main_image VARCHAR(3000),
  sub_image VARCHAR(3000),
  back_image VARCHAR(3000),
  high_image VARCHAR(3000),


  FOREIGN KEY (color_id) REFERENCES color (id),
  FOREIGN KEY (keyword_id) REFERENCES keyword (id),
  FOREIGN KEY (type_id) REFERENCES type (id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (subcategory_id) REFERENCES subcategory (id),
  FOREIGN KEY (gender_id) REFERENCES gender (id)
);
-- migrate:down

DROP TABLE products;
