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

