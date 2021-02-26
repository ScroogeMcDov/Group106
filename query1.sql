
-- Test that the correct foreign keys were create
CREATE TABLE client (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    CONSTRAINT full_name UNIQUE (first_name,last_name)
)ENGINE=InnoDB;

CREATE TABLE employee(
  id INT(11) AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  start_date DATE NOT NULL,
  email VARCHAR(255) NOT NULL,
  CONSTRAINT full_name UNIQUE (first_name,last_name)
)ENGINE=InnoDB;

CREATE TABLE project(
  id INT(11) AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL UNIQUE,
  comments TEXT,
  cid INT(11),
  FOREIGN KEY(cid) REFERENCES client(id)
)ENGINE=InnoDB;

CREATE TABLE works_on(
  pid INT,
  eid INT,
  due_date DATE NOT NULL,
  FOREIGN KEY(Pid) REFERENCES project(id),
  FOREIGN KEY(eid) REFERENCES employee(id),
  PRIMARY KEY (eid,pid)
)ENGINE=InnoDB;

DESCRIBE client;
DESCRIBE employee;
DESCRIBE project;
DESCRIBE works_on;

-- Test that the correct foreign keys were created
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_SCHEMA = 'grade';
