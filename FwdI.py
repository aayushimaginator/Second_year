import numpy as np

def newton_forward(x, y, target):
    n = len(x)
    h = x[1] - x[0]
    diff = np.zeros((n, n))
    diff[:, 0] = y
    
    for j in range(1, n):
        for i in range(n - j):
            diff[i][j] = diff[i+1][j-1] - diff[i][j-1]

    p = (target - x[0]) / h
    result = diff[0, 0]
    term = 1
    for i in range(1, n):
        term *= (p - (i - 1)) / i
        result += term * diff[0, i]
        
    return result

x_pts = [float(i) for i in input("Enter x values: ").split()]
y_pts = [float(i) for i in input("Enter y values: ").split()]
target = float(input("Enter target value: "))
print(f"Forward Interpolation at x={target}: {newton_forward(x_pts, y_pts, target):.4f}")