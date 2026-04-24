import numpy as np

def divided_diff(x, y, target):
    n = len(x)
    coef = np.zeros([n, n])
    coef[:,0] = y
    
    for j in range(1, n):
        for i in range(n - j):
            coef[i][j] = (coef[i+1][j-1] - coef[i][j-1]) / (x[i+j] - x[i])
    
    res = coef[0,0]
    for i in range(1, n):
        term = coef[0,i]
        for j in range(i):
            term *= (target - x[j])
        res += term
    return res

x_pts = [float(i) for i in input("Enter x values: ").split()]
y_pts = [float(i) for i in input("Enter y values: ").split()]
target = float(input("Enter target value: "))
print(f"Divided Difference at x={target}: {divided_diff(x_pts, y_pts, target):.4f}")