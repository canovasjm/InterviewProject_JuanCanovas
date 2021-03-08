#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb 27 19:07:36 2021

@author: jm
"""

# %% required libraries
import pandas as pd
import requests
import os
from task1.helpers import Helper
from sqlalchemy import create_engine, MetaData, Table

# %% read data
employee_roster = pd.read_excel("datasources/Employee_Roster_Data.xlsx", sheet_name = "Sheet1")
employee_roster.head()

# %% explore data set
# unique currencies
currencies = employee_roster['Currency'].unique()
print(currencies)

# is there any row with NA?
employee_roster[employee_roster['Currency'].isna()]
employee_roster[employee_roster['Salary'].isna()]

# data set info
employee_roster.info()

# %% fixer.io API
# parameters for the query
API_KEY = os.environ.get('API_KEY_FIXER')
#API_KEY = 'YOUR_API_KEY'
date = '2017-04-03'

# api_url
api_url = f"http://data.fixer.io/api/{date}?access_key={API_KEY}&symbols=GBP,USD,BRL,AUD" 

# make GET request
response = requests.get(api_url)
print(response.status_code)

# extract exchange rates from the request
rates = response.json()['rates']
print(rates)

# %% use methods defined in helpers.py
# copy df
employee_roster1 = employee_roster.copy()

# convert currencies
exchange = Helper(rates)
exchange.to_EUR(employee_roster1)
exchange.to_USD(employee_roster1)

# remove columns we don't need
employee_roster1 = employee_roster1.iloc[:, ~employee_roster1.columns.isin(['Salary', 'Currency', 'salary_eur'])]

#employee_roster1.to_excel('pandas_to_excel.xls', index=False)

# %% connect to DB and send data
# create connection using pymssql
engine = create_engine('mssql+pymssql://sa:<YourStrong@Passw0rd>@localhost:1433/rga')
connection = engine.connect()

# send employee_roster data frame to SQL Server
employee_roster1.to_sql('EmployeeRoster', con = connection, if_exists = 'replace', index = False)

# %% check if table was created correctly
# create a query
stmt = 'SELECT * FROM EmployeeRoster'

# execute the query
result_proxy = connection.execute(stmt)
results = result_proxy.fetchmany(size = 10)

# examine first row
first_row = results[0]
print(first_row)
print(first_row.keys())
print(first_row.salary_usd)

# MetaData for reflexion
metadata = MetaData()

# retrieve EmployeeRoster table
TBL_EmployeeRoster = Table('EmployeeRoster', metadata, autoload = True, autoload_with = engine)

# print EmployeeRoster table metadata info as is in SQL Server
print(repr(TBL_EmployeeRoster))
TBL_EmployeeRoster.columns.keys()
