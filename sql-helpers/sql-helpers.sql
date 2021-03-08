/* check created tables */
SELECT * FROM rga.INFORMATION_SCHEMA.TABLES;

/* create database */
CREATE DATABASE rga;
USE rga;

/* create database backup*/


/* drop database */
-- DROP DATABASE rga;  

/* drop tables */
-- DROP TABLE rga.dbo.Emails;
-- DROP TABLE rga.dbo.Hours;
-- DROP TABLE rga.dbo.EmployeeRoster;
-- DROP TABLE rga.dbo.DIM_Department;

/* drop sequence */
-- DROP SEQUENCE emp_dep_seq;

/* count rows in tables */
SELECT COUNT(*) FROM rga.dbo.Emails;
SELECT COUNT(*) FROM rga.dbo.Hours;
SELECT COUNT(UserId) FROM rga.dbo.Hours;
SELECT COUNT(*) FROM rga.dbo.Skills;
SELECT COUNT(*) FROM rga.dbo.EmployeeRoster;
SELECT COUNT(*) FROM rga.dbo.DIM_Currency;
SELECT COUNT(*) FROM rga.dbo.DIM_Department;
SELECT COUNT(*) FROM rga.dbo.DIM_Gender;
SELECT COUNT(*) FROM rga.dbo.DIM_User;
SELECT COUNT(id_user) FROM rga.dbo.DIM_User;
SELECT COUNT(DISTINCT id_user) FROM rga.dbo.DIM_User;
SELECT COUNT(DISTINCT User_ID) FROM rga.dbo.EmployeeRoster;

/* select columns from Skills */
SELECT TOP(10) Department FROM rga.dbo.Skills;
SELECT TOP(10) [Attribute Verified] FROM rga.dbo.Skills;

/* select top rows from all columns */
SELECT TOP(5) * FROM rga.dbo.EmployeeRoster;
SELECT TOP(5) * FROM rga.dbo.Hours;
SELECT TOP(5) * FROM rga.dbo.Skills;
SELECT TOP(5) * FROM rga.dbo.DIM_User;
SELECT TOP(5) * FROM rga.dbo.DIM_Department;

SELECT * FROM rga.dbo.EmployeeRoster;
SELECT * FROM rga.dbo.DIM_Department;

SELECT [Attribute Group] FROM Skills;
SELECT [attribute_group] FROM DIM_AttributeGroup;
SELECT attribute_sub_group FROM DIM_AttributeSubGroup;
SELECT attribute_name FROM DIM_AttributeName;

SELECT DISTINCT [Attribute Level] FROM rga.dbo.Skills;

/* create PK in existing table */
ALTER TABLE DIM_User 
ADD CONSTRAINT PK_user PRIMARY KEY (id_user);

