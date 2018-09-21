CREATE DATABASE IF NOT EXISTS ReconTool;
USE ReconTool;
 CREATE TABLE IF NOT EXISTS ReconFiles (
	id int(10) NOT NULL auto_increment,
	name varchar(45),
	description varchar(255),
	runschedule varchar(100),
	information varchar(255),
	PRIMARY KEY( id )
);
 CREATE TABLE IF NOT EXISTS BreakActions (
	id int(10) NOT NULL auto_increment,
	name varchar(100),
	action1 varchar(100),
	action2 varchar(100),
	PRIMARY KEY( id )
);
CREATE TABLE IF NOT EXISTS FileRowData (
	id int(10) NOT NULL auto_increment,
	reconfiles_id int(10),
	jsonrowdata varchar(500),
	breakactions_id int(10),
	action varchar(45),
	comment varchar(500),
	insertdate varchar(50),
	PRIMARY KEY( id ),
	FOREIGN KEY (reconfiles_id) REFERENCES ReconFiles(id),
	FOREIGN KEY (breakactions_id) REFERENCES BreakActions(id)
);
 CREATE TABLE IF NOT EXISTS ReconUsers (
	id int(10) NOT NULL auto_increment,
	username varchar(45),
	password varchar(45),
	role varchar(45),
	application varchar(45),
	PRIMARY KEY( id )
);
CREATE TABLE `recontool`.`fomosystems` (
  `id` INT NOT NULL,
  `tradeid` VARCHAR(45) NOT NULL,
  `counterparty` VARCHAR(100) NULL,
  `currency` VARCHAR(45) NULL,
  `amount` VARCHAR(45) NULL,
  `buyorsell` VARCHAR(45) NULL,
  `tradedate` VARCHAR(45) NULL,
  `fees` VARCHAR(45) NULL,
  `quantity` VARCHAR(45) NULL,
  `exchange` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `rate` VARCHAR(45) NULL,
  `settlementdate` VARCHAR(45) NULL,
  `systemname` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

