import numpy as np

def gauss_elimination():
    n = int(input("Number of variables: "))
    print("Enter the Augmented Matrix row by row:")
    Ab = []
    for i in range(n):
        Ab.append([float(x) for x in input(f"Row {i+1}: ").split()])
    
    Ab = np.array(Ab).astype(float)

    for i in range(n):
        for j in range(i + 1, n):
            ratio = Ab[j, i] / Ab[i, i]
            Ab[j] -= ratio * Ab[i]

    x = np.zeros(n)
    for i in range(n - 1, -1, -1):
        x[i] = (Ab[i, -1] - np.sum(Ab[i, i+1:n] * x[i+1:n])) / Ab[i, i]
        
    print(f"Solution: {x}")

gauss_elimination()