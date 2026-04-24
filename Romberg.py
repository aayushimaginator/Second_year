import numpy as np

def romberg(f, a, b, n_rows):
    R = np.zeros((n_rows, n_rows))
    h = b - a
    R[0, 0] = 0.5 * h * (f(a) + f(b))
    
    for i in range(1, n_rows):
        h /= 2
        sum_new_pts = sum(f(a + k*h) for k in range(1, 2**i, 2))
        R[i, 0] = 0.5 * R[i-1, 0] + sum_new_pts * h
        
        for j in range(1, i + 1):
            R[i, j] = R[i, j-1] + (R[i, j-1] - R[i-1, j-1]) / (4**j - 1)       
    return R

func = lambda x: 1 / (1 + x)
result_table = romberg(func, 0, 1, 4)
print("Romberg Table:\n", result_table)
print("Most accurate value:", result_table[-1, -1])