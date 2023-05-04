DROP TABLE IF EXISTS AerospaceSector.Missionpayload;
DROP TABLE IF EXISTS AerospaceSector.Mission;
DROP TABLE IF EXISTS AerospaceSector.Launchpad;
DROP TABLE IF EXISTS AerospaceSector.Rocket;
DROP TABLE IF EXISTS AerospaceSector.Manufacturer;
DROP TABLE IF EXISTS AerospaceSector.Payload;

DROP SCHEMA IF EXISTS AerospaceSector;


CREATE SCHEMA AerospaceSector;
USE AerospaceSector;

CREATE TABLE AerospaceSector.Payload (
	payloadID INT PRIMARY KEY auto_increment,
    name VARCHAR(50) NOT NULL,
    weight FLOAT,
    human TINYINT
);

CREATE TABLE AerospaceSector.Manufacturer (
	manufacturerID INT PRIMARY KEY NOT NULL auto_increment,
    name VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    ceo VARCHAR(45),
    governementInstitute TINYINT NOT NULL
);	

CREATE TABLE AerospaceSector.Rocket (
	rocketID INT PRIMARY KEY NOT NULL auto_increment,
    model VARCHAR(45) NOT NULL,
    status VARCHAR(20) NOT NULL,
    price FLOAT,
    manufacturerID INT NOT NULL,
    FOREIGN KEY (manufacturerID) REFERENCES AerospaceSector.Manufacturer(manufacturerID)
);

CREATE TABLE AerospaceSector.Launchpad (
	launchpadID INT PRIMARY KEY NOT NULL auto_increment,
    name VARCHAR(60) NOT NULL,
    country VARCHAR(30) NOT NULL,
    owner VARCHAR(50) NOT NULL
);

CREATE TABLE AerospaceSector.Mission (
	missionID INT PRIMARY KEY NOT NULL auto_increment,
    name VARCHAR(60),
    buyer VARCHAR(40),
    mission_date DATE,
    rocketID INT NOT NULL,
    Launched TINYINT NOT NULL,
    FOREIGN KEY (rocketID) REFERENCES AerospaceSector.Rocket(rocketID),
    launchpadID INT,
    FOREIGN KEY (launchpadID) REFERENCES AerospaceSector.Launchpad(launchpadID)
);

CREATE TABLE AerospaceSector.Missionpayload (
	missionID INT,
    payloadID INT,
    CONSTRAINT PK_Missionpayload PRIMARY KEY (missionID, payloadID),
    CONSTRAINT FK_Missionpayload_Mission FOREIGN KEY (missionID) REFERENCES AerospaceSector.Mission(missionID),
    CONSTRAINT FK_Missionpayload_Payload FOREIGN KEY (payloadID) REFERENCES AerospaceSector.Payload(payloadID)
);