-- migrate:up
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE KEY,
  password VARCHAR(300) NOT NULL,
  name VARCHAR(100) NOT NULL,
  phone_number VARCHAR(100) NOT NULL,
  date_of_birth VARCHAR(100),
  gender VARCHAR(50),
  dormancy_prevention_period INT
  )

-- migrate:down

DROP TABLE users;
