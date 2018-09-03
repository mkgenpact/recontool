CREATE DATABASE IF NOT EXISTS ReconTool;
 CREATE TABLE IF NOT EXISTS ReconFiles (
	id int(10) NOT NULL auto_increment,
	name varchar(45),
	filepath varchar(45),
	description varchar(255),
	PRIMARY KEY( id )
);
 CREATE TABLE IF NOT EXISTS FileRowData (
	id int(10) NOT NULL auto_increment,
	reconfiles_id numeric(9,2),
	jsonrowdata blob,
	action varchar(45),
	PRIMARY KEY( id ),
	FOREIGN KEY (reconfiles_id) REFERENCES ReconFiles(id)
);
 CREATE TABLE IF NOT EXISTS ReconUsers (
	id int(10) NOT NULL auto_increment,
	username varchar(45),
	password varchar(45),
	role varchar(45),
	application varchar(45),
	PRIMARY KEY( id )
);
 CREATE TABLE IF NOT EXISTS BreakActions (
	id int(10) NOT NULL auto_increment,
	name varchar(100),
	action1 varchar(100),
	action2 varchar(100),
	PRIMARY KEY( id )
);
