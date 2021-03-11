#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  8 18:04:51 2021

@author: jm
"""

# required libraries
import pytest
import pandas as pd
import numpy as np
from task1.helpers import Helper

# sample rate values for different currencies
rates = {'USD': 1.067218}

# sample data frame
df = pd.DataFrame({'salary_eur': [1]})

# test method logic
def test_dollar_conversion():
    
    # start instance of class Helper
    exchange = Helper(rates)
    
    # convert currencies using method to_USD()
    conversion_df = exchange.to_USD(df)
    
    # values
    actual = np.array(conversion_df['salary_usd'])
    expected = np.array([1.067218])
    message1 = "to_USD(df) should return a data frame, but it actually returned {0}".format(str(type(conversion_df)))
    message2 = "Error in the logic of currency conversion"
    
    # assert statements
    assert isinstance(conversion_df, pd.DataFrame), message1
    assert actual == pytest.approx(expected), message2
