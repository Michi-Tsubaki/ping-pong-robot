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

# 残差の平方和
residuals = y - predicted_y
rss = np.sum(residuals**2)

# 結果の表示
print("推定されたパラメータ:")
print("a:", a)
print("b:", b)
print("残差の平方和:", rss)
print("予測値:", predicted_y)
