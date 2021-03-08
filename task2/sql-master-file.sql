/* 
 This is a SQL master file. It has all the same SQL code present in other files, 
 but here is in one place. 
 */

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



/* create DIM tables */

-- create DIM_Currency
CREATE TABLE rga.dbo.DIM_Currency (
	id_currency int NOT NULL,
	currency varchar(100) NULL,
	CONSTRAINT DIM_Currency_PK PRIMARY KEY (id_currency)
) GO


-- create DIM_Department
CREATE TABLE rga.dbo.DIM_Department (
	id_department int NOT NULL,
	department varchar(1000) NULL,
	CONSTRAINT DIM_Department_PK PRIMARY KEY (id_department)
) GO


-- create DIM_Gender
CREATE TABLE rga.dbo.DIM_Gender (
	id_gender int NOT NULL,
	gender varchar(100) NULL,
	CONSTRAINT DIM_Gender_PK PRIMARY KEY (id_gender)
) GO


-- create DIM_User
CREATE TABLE rga.dbo.DIM_User (
	id_user int NOT NULL,
	id_email int NULL,
	fullname varchar(1000) NULL,
	CONSTRAINT DIM_User_PK PRIMARY KEY (id_user)
) GO


-- create DIM_AttributeGroup
CREATE TABLE rga.dbo.DIM_AttributeGroup (
	id_att_group int NOT NULL,
	attribute_group varchar(1000) NULL,
	CONSTRAINT DIM_AttributeGroup_PK PRIMARY KEY (id_att_group)
) GO


-- create DIM_AttributeSubGroup
CREATE TABLE rga.dbo.DIM_AttributeSubGroup (
	id_att_sub_group int NOT NULL,
	attribute_sub_group varchar(1000) NULL,
	CONSTRAINT DIM_AttributeSubGroup_PK PRIMARY KEY (id_att_sub_group)
) GO


-- create DIM_AttributeName
CREATE TABLE rga.dbo.DIM_AttributeName (
	id_att_name int NOT NULL,
	attribute_name varchar(1000) NULL,
	CONSTRAINT DIM_AttributeName_PK PRIMARY KEY (id_att_name)
) GO



/* create relationship between tables */

/* relationships to EmployeeRoster */

-- DIM_Department to EmployeeRoster
ALTER TABLE rga.dbo.EmployeeRoster ADD id_department int NULL GO
ALTER TABLE rga.dbo.EmployeeRoster ADD CONSTRAINT ER_DIM_Department_FK FOREIGN KEY (id_department) REFERENCES rga.dbo.DIM_Department(id_department) GO
UPDATE rga.dbo.EmployeeRoster
SET id_department = (SELECT id_department FROM DIM_Department dd WHERE rga.dbo.EmployeeRoster.Department = dd.department);


-- DIM_Currency to EmployeeRoster
ALTER TABLE rga.dbo.EmployeeRoster ADD id_currency int NULL GO
ALTER TABLE rga.dbo.EmployeeRoster ADD CONSTRAINT ER_DIM_Currency_FK FOREIGN KEY (id_currency) REFERENCES rga.dbo.DIM_Currency(id_currency) GO
UPDATE rga.dbo.EmployeeRoster
SET id_currency = (SELECT id_currency FROM DIM_Currency dc WHERE rga.dbo.EmployeeRoster.Currency = dc.currency);


-- DIM_Gender to EmployeeRoster
ALTER TABLE rga.dbo.EmployeeRoster ADD id_gender int NULL GO
ALTER TABLE rga.dbo.EmployeeRoster ADD CONSTRAINT ER_DIM_Gender_FK FOREIGN KEY (id_gender) REFERENCES rga.dbo.DIM_Gender(id_gender) GO
UPDATE rga.dbo.EmployeeRoster
SET id_gender = (SELECT id_gender FROM DIM_Gender dg WHERE rga.dbo.EmployeeRoster.Gender = dg.gender);


-- DIM_User to EmployeeRoster
ALTER TABLE rga.dbo.EmployeeRoster ADD CONSTRAINT ER_DIM_User_FK FOREIGN KEY (User_ID) REFERENCES rga.dbo.DIM_User(id_user) GO


/* relationships to Skills */

-- DIM_Department to Skills
ALTER TABLE rga.dbo.Skills ADD id_department int NULL GO
ALTER TABLE rga.dbo.Skills ADD CONSTRAINT SK_DIM_Department_FK FOREIGN KEY (id_department) REFERENCES rga.dbo.DIM_Department(id_department) GO
UPDATE rga.dbo.Skills 
SET id_department = (SELECT id_department FROM DIM_Department dd WHERE rga.dbo.Skills.Department = dd.department);


-- DIM_Gender to Skills
ALTER TABLE rga.dbo.Skills ADD id_gender int NULL GO
ALTER TABLE rga.dbo.Skills ADD CONSTRAINT SK_DIM_Gender_FK FOREIGN KEY (id_gender) REFERENCES rga.dbo.DIM_Gender(id_gender) GO
UPDATE rga.dbo.Skills 
SET id_gender = (SELECT id_gender FROM DIM_Gender dg WHERE rga.dbo.Skills.Gender = dg.gender);


-- DIM_User to Skills
ALTER TABLE rga.dbo.Skills ADD CONSTRAINT SK_DIM_User_FK FOREIGN KEY (UserId) REFERENCES rga.dbo.DIM_User(id_user) GO


-- DIM_AttributeGroup to Skills
ALTER TABLE rga.dbo.Skills ADD id_att_group int NULL GO
ALTER TABLE rga.dbo.Skills ADD CONSTRAINT SK_DIM_AttributeGroup_FK FOREIGN KEY (id_att_group) REFERENCES rga.dbo.DIM_AttributeGroup(id_att_group) GO
UPDATE rga.dbo.Skills 
SET id_att_group = (SELECT id_att_group FROM DIM_AttributeGroup dg WHERE rga.dbo.Skills.[Attribute Group] = dg.attribute_group);


-- DIM_AttributeSubGroup to Skills
ALTER TABLE rga.dbo.Skills ADD id_att_sub_group int NULL GO
ALTER TABLE rga.dbo.Skills ADD CONSTRAINT SK_DIM_AttributeSubGroup_FK FOREIGN KEY (id_att_sub_group) REFERENCES rga.dbo.DIM_AttributeSubGroup(id_att_sub_group) GO
UPDATE rga.dbo.Skills 
SET id_att_sub_group = (SELECT id_att_sub_group FROM DIM_AttributeSubGroup ds WHERE rga.dbo.Skills.[Attribute Sub-Group] = ds.attribute_sub_group);


-- DIM_AttributeName to Skills
ALTER TABLE rga.dbo.Skills ADD id_att_name int NULL GO
ALTER TABLE rga.dbo.Skills ADD CONSTRAINT SK_DIM_AttributeName_FK FOREIGN KEY (id_att_name) REFERENCES rga.dbo.DIM_AttributeName(id_att_name) GO
UPDATE rga.dbo.Skills 
SET id_att_name = (SELECT id_att_name FROM DIM_AttributeName dn WHERE rga.dbo.Skills.[Attribute Name] = dn.[attribute_name]);


/* relationships to Hours */

-- DIM_User to Hours
ALTER TABLE rga.dbo.Hours ADD CONSTRAINT HR_DIM_User_FK FOREIGN KEY (UserId) REFERENCES rga.dbo.DIM_User(id_user) GO


/* relationships to Emails */

-- DIM_User to Emails
ALTER TABLE rga.dbo.Emails ADD id_user int NULL GO
ALTER TABLE rga.dbo.Emails ADD CONSTRAINT Emails_FK FOREIGN KEY (id_user) REFERENCES rga.dbo.DIM_User(id_user) GO
UPDATE rga.dbo.Emails 
SET id_user = (SELECT id_user FROM DIM_User du WHERE rga.dbo.Emails.from_ID = du.id_email);


/* remove useless columns */

/* from table EmployeeRoster */
ALTER TABLE rga.dbo.EmployeeRoster DROP COLUMN Department GO
ALTER TABLE rga.dbo.EmployeeRoster DROP COLUMN Currency GO
ALTER TABLE rga.dbo.EmployeeRoster DROP COLUMN Gender GO
ALTER TABLE rga.dbo.EmployeeRoster DROP COLUMN Fullname GO
ALTER TABLE rga.dbo.EmployeeRoster DROP COLUMN Email_ID GO


/* from table Skills */
ALTER TABLE rga.dbo.Skills DROP COLUMN Department GO
ALTER TABLE rga.dbo.Skills DROP COLUMN Gender GO
ALTER TABLE rga.dbo.Skills DROP COLUMN Fullname GO
ALTER TABLE rga.dbo.Skills DROP COLUMN [Attribute Group] GO
ALTER TABLE rga.dbo.Skills DROP COLUMN [Attribute Sub-Group] GO
ALTER TABLE rga.dbo.Skills DROP COLUMN [Attribute Name] GO



/* create new fields */

-- create TotalWorkingHours
ALTER TABLE rga.dbo.Hours ADD TotalWorkingHours int NULL GO
UPDATE rga.dbo.Hours
SET TotalWorkingHours = 40;


-- create UtilizationPercent
ALTER TABLE rga.dbo.Hours ADD UtilizacionPercent float NULL GO
UPDATE rga.dbo.Hours
SET UtilizacionPercent =  
	( CASE 
		WHEN ((TotalWorkingHoursWeek * 4) - (AdminHrs1 + AdminHrs2 + AdminHrs3)) <= 0 THEN 0 
		ELSE ((ClientHrs1 + ClientHrs2 + ClientHrs3) / ((TotalWorkingHoursWeek * 4) - (AdminHrs1 + AdminHrs2 + AdminHrs3))) 
	END
);


-- create ClientTimePercent
ALTER TABLE rga.dbo.Hours ADD ClientTimePercent float NULL GO
UPDATE rga.dbo.Hours
SET ClientTimePercent = ((ClientHrs1 + ClientHrs2 + ClientHrs3) / (TotalWorkingHoursWeek * 4));


-- create AdminTimePercent
ALTER TABLE rga.dbo.Hours ADD AdminTimePercent float NULL GO
UPDATE rga.dbo.Hours
SET AdminTimePercent = ((AdminHrs1 + AdminHrs2 + AdminHrs3) / (TotalWorkingHoursWeek * 4));


-- create SkillLevel
ALTER TABLE rga.dbo.Skills ADD SkillLevel varchar(100) NULL GO
UPDATE rga.dbo.Skills
SET SkillLevel =  
	( CASE 
		WHEN [Attribute Level] = 0 THEN 'wants to learn'
		WHEN [Attribute Level] BETWEEN 1 AND 2 THEN 'heavy supervision'
		WHEN [Attribute Level] BETWEEN 3 AND 4 THEN 'light supervision'
		ELSE 'expert' 
	END
);
