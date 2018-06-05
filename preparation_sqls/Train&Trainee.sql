CREATE DATABASE MICROSERVICEDEV;

CREATE TABLE IF NOT EXISTS `MICROSERVICEDEV`.`TRAINING` (
  `ID` INT NOT NULL,   
  `TRAINING_PLAN_ID` INT NOT NULL,
  `TRAINING_STATE_IND` INT NOT NULL DEFAULT 0 COMMENT '0-PLANNED 1-IN-PROGRESS 2-CANCELLED 3-CONFIRMED 4-TRAIN STARTED 5-TRAIN FINISHED 6-SEND FEEDBACK TO TRAINEE/COMPLETED',
  `TRAINING_TITLE` VARCHAR(200) NOT NULL DEFAULT '',
  `TRAINING_START_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TRAINING_END_TIME` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TRAINING_DURATION` INT NOT NULL DEFAULT 0 COMMENT 'THIS IS CALCULATED BY MINUTES',
  `TRAINING_LOCATION` VARCHAR(200) NOT NULL DEFAULT '',
  `TRAINING_DESCRIPTION` TEXT NOT NULL,  
  `TRAINIER` VARCHAR(500) NOT NULL DEFAULT '' COMMENT 'E.G. TRAINER1_ID:TRAINER_NAME|TRAINER2_ID:TRAINER_NAME',
  `CREATOR_ID` INT NOT NULL DEFAULT 0,  
  `CREATOR` VARCHAR(45) NOT NULL DEFAULT '',
  `CREATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY_ID` INT NOT NULL DEFAULT 0,  
  `UPDATED_BY` VARCHAR(45) NOT NULL DEFAULT '',
  `LAST_UPDATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_IND` INT NOT NULL DEFAULT 0,
  `DELETED_BY` VARCHAR(45) NOT NULL DEFAULT '',
  `DELETED_BY_ID` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`));
  
  
CREATE TABLE IF NOT EXISTS `MICROSERVICEDEV`.`TRAINER` (
  `ID` INT NOT NULL,    
  `TRAINER_EID` VARCHAR(50) NOT NULL,    
  `TRAINER_STATE_IND` INT NOT NULL,
  `TRAINER_DESCRIPTION` VARCHAR(500) NOT NULL DEFAULT '',
  `CREATOR_ID` INT NOT NULL DEFAULT 0,  
  `CREATOR` VARCHAR(45) NOT NULL DEFAULT '',
  `CREATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY_ID` INT NOT NULL DEFAULT 0,  
  `UPDATED_BY` VARCHAR(45) NOT NULL DEFAULT '',
  `LAST_UPDATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_IND` INT NOT NULL DEFAULT 0,
  `DELETED_BY` VARCHAR(45) NOT NULL DEFAULT '',
  `DELETED_BY_ID` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`));
  
  
CREATE TABLE IF NOT EXISTS `MICROSERVICEDEV`.`TRAINEE_RECORDS` (
  `ID` INT NOT NULL,   
  `TRAINEE_RECORDS_ID` INT NOT NULL  COMMENT 'THE USER WHO ATTEND THE TRAINING',    
  `TRAINEE_EID`VARCHAR(45) NOT NULL DEFAULT '',
  `TRAINING_ID` INT NOT NULL,  
  `CREATOR_ID` INT NOT NULL DEFAULT 0,  
  `CREATOR` VARCHAR(45) NOT NULL DEFAULT '',
  `CREATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY_ID` INT NOT NULL DEFAULT 0,  
  `UPDATED_BY` VARCHAR(45) NOT NULL DEFAULT '',
  `LAST_UPDATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DELETED_IND` INT NOT NULL DEFAULT 0,
  `DELETED_BY` VARCHAR(45) NOT NULL DEFAULT '',
  `DELETED_BY_ID` INT NOT NULL DEFAULT 0,
  `TRAINEE_STATE_IND` CHAR(1) NOT NULL DEFAULT '' COMMENT '0-REGISTER SUCCESSFULLY 1-SELF CANCEL THE TRAINING 2- NO SHOW 3-CHECKED IN 4- RESPONDED THE FEEDBACK / COMPLETED',
  PRIMARY KEY (`ID`));
  
  ALTER TABLE `MICROSERVICEDEV`.`TRAINEE_RECORDS` 
  ADD UNIQUE INDEX `TRAINING_ID_UNIQUE` (`TRAINEE_RECORDS_ID` ASC, `TRAINING_ID` ASC);
  
INSERT INTO `MICROSERVICEDEV`.`TRAINING`
(`ID`,
`TRAINING_PLAN_ID`,
`TRAINING_STATE_IND`,
`TRAINING_TITLE`,
`TRAINING_START_TIME`,
`TRAINING_END_TIME`,
`TRAINING_DURATION`,
`TRAINING_LOCATION`,
`TRAINING_DESCRIPTION`,
`TRAINIER`,
`CREATOR_ID`,
`CREATOR`,
`CREATE_DATE`,
`UPDATED_BY_ID`,
`UPDATED_BY`,
`LAST_UPDATE_DATE`,
`DELETED_IND`,
`DELETED_BY`,
`DELETED_BY_ID`)
VALUES
(1,
201801,
0,
'Training1',
'20180505',
'20180505',
120,
'24#9T001',
'Training description 01',
'1:test.trainer',
1,
'admin',
CURRENT_TIMESTAMP,
1,
'admin',
CURRENT_TIMESTAMP,
0,
'',
0);


  INSERT INTO `MICROSERVICEDEV`.`TRAINEE_RECORDS`
(`ID`,
`TRAINEE_RECORDS_ID`,
`TRAINING_ID`,
`TRAINEE_EID`,
`CREATOR_ID`,
`CREATOR`,
`CREATE_DATE`,
`UPDATED_BY_ID`,
`UPDATED_BY`,
`LAST_UPDATE_DATE`,
`DELETED_IND`,
`DELETED_BY`,
`DELETED_BY_ID`,
`TRAINEE_STATE_IND`)
VALUES
(1,
1,
1,
'fangzhou.li',
1,
'admin',
CURRENT_TIMESTAMP,
1,
'admin',
CURRENT_TIMESTAMP,
0,
'',
0,
0);


  INSERT INTO `MICROSERVICEDEV`.`TRAINEE_RECORDS`
(`ID`,
`TRAINEE_RECORDS_ID`,
`TRAINING_ID`,
`TRAINEE_EID`,
`CREATOR_ID`,
`CREATOR`,
`CREATE_DATE`,
`UPDATED_BY_ID`,
`UPDATED_BY`,
`LAST_UPDATE_DATE`,
`DELETED_IND`,
`DELETED_BY`,
`DELETED_BY_ID`,
`TRAINEE_STATE_IND`)
VALUES
(2,
2,
1,
'xiaohui.c.liu',
1,
'admin',
CURRENT_TIMESTAMP,
1,
'admin',
CURRENT_TIMESTAMP,
0,
'',
0,
0);

