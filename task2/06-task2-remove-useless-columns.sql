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



