#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  1 18:17:07 2021

@author: jm
"""

# %% required libraries
import numpy as np
import pandas as pd
from sqlalchemy import create_engine


# %% connect to DB
# create connection using pymssql
engine = create_engine('mssql+pymssql://sa:<YourStrong@Passw0rd>@localhost:1433/rga')
connection = engine.connect()


# %% read data sets from where I will build the dimension tables
# read employee roster data
employee_roster = pd.read_excel("datasources/Employee_Roster_Data.xlsx", sheet_name = 'Sheet1')

# read skills data
skills = pd.read_excel("datasources/skills.xlsx", sheet_name = "Sheet1")

# read hours data
hours = pd.read_excel("datasources/hours.xlsx", sheet_name = "Sheet1")


# %% dimensions created from source employee_roster

# %% create DIM_Currency
# get unique values
currencies = sorted(employee_roster['Currency'].unique())

# create a data frame 
DIM_Currency = pd.DataFrame({'id_currency': (np.arange(len(currencies)) + 1), 'currency': currencies})

# send data frame to DB
DIM_Currency.to_sql('DIM_Currency', con = connection, if_exists = 'append', index = False)

# %% create DIM_Department
# get unique values
departments = sorted(pd.concat([employee_roster['Department'], skills['Department']], axis = 0).unique())

# create a data frame 
DIM_Department = pd.DataFrame({'id_department': (np.arange(len(departments)) + 1), 'department': departments})

# send data frame to DB
DIM_Department.to_sql('DIM_Department', con = connection, if_exists = 'append', index = False)

# %% create DIM_Gender
# get unique values
genders = sorted(pd.concat([employee_roster['Gender'], skills['Gender']], axis = 0).unique())

# create a data frame 
DIM_Gender = pd.DataFrame({'id_gender': (np.arange(len(genders)) + 1), 'gender': genders})

# send data frame to DB
DIM_Gender.to_sql('DIM_Gender', con = connection, if_exists = 'append', index = False)

# %% create DIM_User
# check if 'UserId' values in 'skills' are in 'User_ID' in 'employee_roster'
# we get 20134 'True' values, meaning that all 'UserId' in 'skills' are already
# in 'User_ID' in employee_roster
users_check_1 = np.isin(skills['UserId'], employee_roster['User_ID']).sum()

# check if 'UserId' values in 'hours' are in 'User_ID' in 'employee_roster'
# we get 7659 'True' values, meaning that NOT all 'UserId' in 'hours' are already
# in 'User_ID' in employee_roster
users_check_2 = np.isin(hours['UserId'], employee_roster['User_ID']).sum()

# get unique values
users = sorted(pd.concat([employee_roster['User_ID'], skills['UserId'], hours['UserId']], axis = 0).unique())

# create a data frame to use pd.merge()
df_users = pd.DataFrame({'User_ID': users})

# left join 'df_user' with 'employee_roster' on 'UserID'
users_final = pd.merge(df_users, employee_roster, on = 'User_ID', how ='left')

# select only columns I need
users_final = users_final[['User_ID', 'Email_ID', 'Fullname']]

# rename columns
users_final.rename(columns = {'User_ID': 'id_user', 'Email_ID': 'id_email', 'Fullname': 'fullname'}, inplace = True)

# send data frame to DB
users_final.to_sql('DIM_User', con = connection, if_exists = 'append', index = False)


# %% dimensions created from source skills

# %% create DIM_AttributeGroup
# get unique values
att_group = sorted(skills['Attribute Group'].unique())

# create a data frame 
DIM_AttributeGroup = pd.DataFrame({'id_att_group': (np.arange(len(att_group)) + 1), 'attribute_group': att_group})

# send data frame to DB
DIM_AttributeGroup.to_sql('DIM_AttributeGroup', con = connection, if_exists = 'append', index = False)

# %% create DIM_AttributeSubGroup
# get unique values
att_sub_group = sorted(skills['Attribute Sub-Group'].unique())

# create a data frame 
DIM_AttributeSubGroup = pd.DataFrame({'id_att_sub_group': (np.arange(len(att_sub_group)) + 1), 'attribute_sub_group': att_sub_group})

# send data frame to DB
DIM_AttributeSubGroup.to_sql('DIM_AttributeSubGroup', con = connection, if_exists = 'append', index = False)

# %% create DIM_AttributeName
# get unique values
att_name = sorted(skills['Attribute Name'].unique())

# create a data frame 
DIM_AttributeName = pd.DataFrame({'id_att_name': (np.arange(len(att_name)) + 1), 'attribute_name': att_name})

# send data frame to DB
DIM_AttributeName.to_sql('DIM_AttributeName', con = connection, if_exists = 'append', index = False)
    
