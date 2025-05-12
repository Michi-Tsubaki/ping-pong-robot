#!/usr/bin/env python3
ls# Description:
# This script is to get the parameter for the ball distance measurement.

import numpy as np
from scipy.optimize import curve_fit

# sampling data ( it is very rough I think. )
y = np.array([10, 20, 30, 40, 50, 60, 70, 80])
x = np.array([110, 70, 50, 40, 34, 30, 24, 18])

#  y = a/x + b ( 反比例＋オフセット )
def function(x, a, b):
    return a / x + b


# fitting ( optimize LSE )
parameters, covariance = curve_fit(function, x, y)

a, b = parameters

# for debug
predicted_y = function(x, a, b)

# res
residuals = y - predicted_y
rss = np.sum(residuals**2) / 8

# result
print("推定されたパラメータ:")
print("a:", a)
print("b:", b)
print("残差の平方和:", rss)
print("予測値:", predicted_y)
