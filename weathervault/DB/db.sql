SET FOREIGN_KEY_CHECKS=OFF; # will be switched to ON at next project part
# enables us to delete tables from our db
DROP TABLE IF EXISTS `UserRegistrations`;
DROP TABLE IF EXISTS `UserLogins`;
DROP TABLE IF EXISTS `UserAccounts`;
DROP TABLE IF EXISTS `UserClimates`;
DROP TABLE IF EXISTS `UserLocationHistory`;


                            # === DATABASE TABLES ===


CREATE TABLE `UserRegistrations`(
    /*
    INTERSECTION TABLE
    Relationships: M:1 | UserLogins
                   M:1 | UserLocationHistory
    */
	`userID` INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`lastName` VARCHAR(255) NOT NULL,
	`firstName` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `zipCode` INT(11) NOT NULL
);


CREATE TABLE `UserLocationHistory`(
    /*
    Stores each location User logged in at.
    Relationships: 1:M | UserRegistrations
                   M:1 | UserAccounts
                   M:1 | UserClimates
    */
	`locationID` INT(11) PRIMARY KEY NOT NULL,
    `zipCode` INT(11) NOT NULL,
    `dateID` DATE NOT NULL
);


CREATE TABLE `UserAccounts`(
    /*
    Contains each User's WeatherVault information.
    Relationships: 1:M | UserRegistrations
                   1:M | UserLogins
    */
    `userID`      INT(11) NOT NULL,
    `locationID`  INT(11) NOT NULL,
    `climate`     VARCHAR(255),
    `temperature` INT(11),
    `isGuide`     TINYINT,

    FOREIGN KEY (`userID`) REFERENCES UserRegistrations(`userID`),

    FOREIGN KEY (`locationID`) REFERENCES `UserLocationHistory`(`locationID`)
);


CREATE TABLE `UserLogins`(
    /*
    Stores each User’s personal information.
    Relationships: 1:M | UserSignups
                   M:1 | UserAccounts
    */
   `userID` INT(11) NOT NULL ,
  `lastName` VARCHAR(255) NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `locationID` INT(11),

  FOREIGN KEY (`userID`) REFERENCES `UserRegistrations`(`userID`),

  FOREIGN KEY (`locationID`) REFERENCES `UserLocationHistory`(`locationID`)
);


CREATE TABLE `UserClimates`(
    /*
    Contains the climate of each User.
    Relationship: 1:M | UserLocationHistory
    */
  `userID` INT(11) NOT NULL,
  `locationID` INT(11) ,
  `climate` VARCHAR(255),
  `temperature` INT(11),
  FOREIGN KEY (`userID`)
  REFERENCES `UserRegistrations`(`userID`),
  FOREIGN KEY (`locationID`)
  REFERENCES `UserLocationHistory`(`locationID`)
);

                            # === DATABASE MANIPULATING ===


DESCRIBE `UserRegistrations`;
DESCRIBE `UserLogins`;
DESCRIBE `UserLocationHistory`;
DESCRIBE `UserAccounts`;
DESCRIBE `UserClimates`;

INSERT INTO `UserRegistrations` ( firstName, lastName, password, email, zipCode)
VALUES  ("Davis", "Ryan", "8583495076","2235@gmail.com","1234");

select * from UserRegistrations;


INSERT INTO `UserLocationHistory` (locationID,dateID, zipCode)
VALUES ("1","2020-11-09", "1234"),
      ("2","2020-12-09", "1234"),
      ("3","2020-12-09", "1234");

select * from UserLocationHistory;


INSERT INTO `UserAccounts` (userID, locationID, climate, temperature, isGuide)
VALUES ("1","1", "Highlights", "54", NULL),
	   ("2","2","Highlands", "41", "1"),
 	   ("3","3","subtropical", "50", "0");

select * from UserAccounts;


 INSERT INTO `UserLogins` (userID, firstName,lastName,  password)
 VALUES ("1","Davis", "Ryan", "8583495076"),
 	   ("2","Champ", "Pog", "3404206969"),
        ("3","Jill","Smith", "1234");

select * from UserLogins;


 INSERT INTO `UserClimates` (userID, locationID,climate, temperature)
 VALUES ("1","1","Highlights", 55),
 	   ("2","2","Highlands", 41),
 	   ("3","3","subtropical", 50);

select * from UserClimates;
