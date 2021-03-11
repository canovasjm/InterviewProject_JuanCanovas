#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 25 19:54:36 2021

@author: jm
"""

# %% helper functions for task1

class Helper:
    def __init__(self, rates):
        self.rates = rates
        
    # convert other currencies to EUR
    def to_EUR(self, df):
        '''Returns currencies converted to EUR'''
        
        # create a list to store results
        salary_eur = []
        
        # iterate over rows
        for i in df.index:
            
            if df['Currency'][i] == 'GBP':
                salary_eur.append(df['Salary'][i] * (1/self.rates['GBP']))
            elif df['Currency'][i] == 'USD':
                salary_eur.append(df['Salary'][i] * (1/self.rates['USD']))
            elif df['Currency'][i] == 'BRL':
                salary_eur.append(df['Salary'][i] * (1/self.rates['BRL'])) 
            else: salary_eur.append(df['Salary'][i] * (1/self.rates['AUD']))
        
        # add 'salary_eur' as a new column in df   
        df['salary_eur'] = salary_eur
        
        # return df with the new column    
        return df
    
    
    # convert EUR to USD
    def to_USD(self, df):
        '''Takes salaries in EUR and converts to USD'''
        
        # create a list to store results
        salary_usd = []
        
        # iterate over rows
        for i in df.index:
            salary_usd.append(df['salary_eur'][i] * self.rates['USD'])
            
        # add 'salary_usd' as a new column in df   
        df['salary_usd'] = salary_usd
        
        # return df with the new column    
        return df
