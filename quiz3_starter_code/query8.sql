CREATE table bsg_spaceship(

   id int NOT NULL AUTO_INCREMENT,

   name VARCHAR (255) NOT NULL,

   separate_saucer_section Boolean NOT NULL DEFAULT FALSE,

   length int NOT NULL,

   PRIMARY KEY (id)

);

DESCRIBE bsg_spaceship;