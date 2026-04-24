import numpy as np

def gauss_seidel():
    n = int(input("Number of variables: "))
    A = []
    print("Enter coefficients of A (row by row):")
    for i in range(n):
        A.append([float(x) for x in input(f"Row {i+1}: ").split()])
    b = [float(x) for x in input("Enter constants b: ").split()]
    
    x = np.zeros(n)
    A = np.array(A)
    b = np.array(b)
    
    for _ in range(100):
        x_old = x.copy()
        for i in range(n):
            s = sum(A[i, j] * x[j] for j in range(n) if i != j)
            x[i] = (b[i] - s) / A[i, i]
            
        if np.allclose(x, x_old, atol=1e-6):
            break
            
    print(f"Gauss-Seidel Solution: {x}")

gauss_seidel()