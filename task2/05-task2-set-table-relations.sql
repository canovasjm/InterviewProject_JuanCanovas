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


