#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar  7 01:12:41 2021

@author: jm
"""

# required libraries
import pytest
import pandas as pd
import numpy as np
from task1.helpers import Helper

# sample rate values for different currencies
rates = {'GBP': 0.854382, 'USD': 1.067218, 'BRL': 3.323288, 'AUD': 1.403282}

# sample data frame
df = pd.DataFrame({'Salary': [1, 1, 1, 1], 
                   'Currency': ['GBP', 'USD', 'BRL', 'AUD']})

# test method logic
def test_euro_conversion():
    
    # start instance of class Helper
    exchange = Helper(rates)
    
    # convert currencies using method to_EUR()
    conversion_df = exchange.to_EUR(df)
    
    # values
    actual = np.array(conversion_df['salary_eur'])
    expected = np.array([1/0.854382, 1/1.067218, 1/3.323288, 1/1.403282])
    message1 = "to_EUR(df) should return the a data frame, but it actually returned {0}".format(str(type(conversion_df)))
    message2 = "Error in the logic of currency conversion"
    
    # assert statements
    assert isinstance(conversion_df, pd.DataFrame), message1
    assert actual == pytest.approx(expected), message2
