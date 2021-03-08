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

