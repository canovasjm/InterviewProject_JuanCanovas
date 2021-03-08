#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb 27 19:07:36 2021

@author: jm
"""

# %% required libraries
import pandas as pd
from sqlalchemy import create_engine, MetaData, Table

# %% connect to DB
# create connection using pymssql
engine = create_engine('mssql+pymssql://sa:<YourStrong@Passw0rd>@localhost:1433/rga')
connection = engine.connect()

# MetaData for reflexion
metadata = MetaData()

# %% employee roster data set
# read employee roster data
employee_roster = pd.read_excel("datasources/Employee_Roster_Data.xlsx", sheet_name = 'Sheet1')

# check if file was read correctly
employee_roster.head(10)
employee_roster.tail()
employee_roster.info()

# send emails data frame to SQL Server
employee_roster.to_sql('EmployeeRoster', con = connection, if_exists = 'append', index = False)

# check if data was uploaded correctly
TBL_EmployeeRoster = Table('EmployeeRoster', metadata, autoload = True, autoload_with = engine)
print(repr(TBL_EmployeeRoster))

# %% email data set
# read email data
emails = pd.read_csv("datasources/Email_Data.txt", sep = "\t")

# check if file was read correctly
emails.head(10)
emails.tail()
emails.info()

# send emails data frame to SQL Server
emails.to_sql('Emails', con = connection, if_exists = 'append', index = False)

# check if data was uploaded correctly
TBL_Emails = Table('Emails', metadata, autoload = True, autoload_with = engine)
print(repr(TBL_Emails))

# %% hours data set
# read hours data
hours = pd.read_excel("datasources/hours.xlsx", sheet_name = "Sheet1")

# check if file was read correctly
hours.head(10)
hours.tail()
hours.info()

# send hours data frame to SQL Server
hours.to_sql('Hours', con = connection, if_exists = 'append', index = False)

# check if data was uploaded correctly
TBL_Hours = Table('Hours', metadata, autoload = True, autoload_with = engine)
print(repr(TBL_Hours))

# %% skills data set
# read skills data
skills = pd.read_excel("datasources/skills.xlsx", sheet_name = "Sheet1")

# check if file was read correctly
skills.head(10)
skills.tail()
skills.info()

# send hours data frame to SQL Server
skills.to_sql('Skills', con = connection, if_exists = 'append', index = False)

# check if data was uploaded correctly
TBL_Skills = Table('Skills', metadata, autoload = True, autoload_with = engine)
print(repr(TBL_Skills))

# %% final check
print(engine.table_names())
