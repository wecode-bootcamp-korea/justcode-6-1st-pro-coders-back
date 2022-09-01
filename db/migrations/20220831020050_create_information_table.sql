-- migrate:up
CREATE TABLE information (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  contents VARCHAR(5000) NOT NULL,
  material VARCHAR(300) NOT NULL,
  sizes VARCHAR(300) NOT NULL,
  manufacturer VARCHAR(300) NOT NULL, 
  country_of_manufacture VARCHAR(300) NOT NULL,
  caution VARCHAR(300) NOT NULL,
  guarantee VARCHAR(300) NOT NULL,
  service_information VARCHAR(300) NOT NULL, 
  FOREIGN KEY (product_id) REFERENCES products (id)
)
-- migrate:down

DROP TABLE information;
