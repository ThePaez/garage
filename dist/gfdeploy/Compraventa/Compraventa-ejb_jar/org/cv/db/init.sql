CREATE DATABASE IF NOT EXISTS tdhub;
USE tdhub;
DROP TABLE users;
CREATE TABLE users(
    Username varchar(255), 
    Password varchar(255), 	
    Email varchar(255),
	FirstName varchar(255), 
	LastName varchar(255),
	BirthDate varchar(255),
    Street1 varchar(255),
    Street2 varchar(255),
	City varchar(255),
    State varchar(255),
    Country varchar(255),
    ZIPCode varchar(255),
	DateCreated datetime,
    MoneyDataId int,
    DesignsCreatedId int,
    MachinesId int,
    DesignsBoughtId int
);
    