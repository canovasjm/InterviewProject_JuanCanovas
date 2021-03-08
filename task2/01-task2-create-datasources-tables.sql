/* create database */
CREATE DATABASE rga;
USE rga;


/* create data source tables */

-- create EmployeeRoster
CREATE TABLE rga.dbo.EmployeeRoster (
	User_ID int NOT NULL,
	Email_ID int NULL,
	Title int NULL,
	Fullname varchar(1000) NULL,
	Department varchar(1000) NULL,
	Gender varchar(100) NULL,
	Office int NULL,
	Region int NULL,
	Tenure_Yrs float NULL,
	Seniority int NULL,
	Salary int NULL,
	Currency varchar(100) NULL,
	Rating int NULL,
	Survey_Score float NULL,
	Promotion int NULL,
	Avg_Hrs float NULL,
	CONSTRAINT EmployeeRoster_PK PRIMARY KEY (User_ID)
) GO


-- create Emails
CREATE TABLE rga.dbo.Emails (
	from_ID int NULL,
	to_ID int NULL
) GO


-- create Hours
CREATE TABLE rga.dbo.Hours (
	[Date] datetime NULL,
	UserId int NULL,
	AdminHrs1 float NULL,
	AdminHrs2 float NULL,
	AdminHrs3 float NULL,
	ClientHrs1 float NULL,
	ClientHrs2 float NULL,
	ClientHrs3 float NULL,
	TargetClientHrs float NULL
) GO


-- create Skills
CREATE TABLE rga.dbo.Skills (
	UserId int NULL,
	Fullname varchar(1000) NULL,
	Department varchar(1000) NULL,
	Gender varchar(100) NULL,
	[Attribute Group] varchar(1000) NULL,
	[Attribute Sub-Group] varchar(1000) NULL,
	[Attribute Type] varchar(100) NULL,
	[Attribute Name] varchar(1000) NULL,
	[Attribute Level] int NULL,
	[Attribute Verified] bit NULL
) GO


