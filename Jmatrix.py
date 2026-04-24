import sympy as sp
import numpy as np

def solve_system_jacobian():
    n = int(input("Number of equations/variables: "))
    vars_str = input("Enter variables separated by space (e.g., x y): ").split()
    symbols = sp.symbols(vars_str)
    
    eqs = []
    for i in range(n):
        eqs.append(sp.sympify(input(f"Eq {i+1} = 0: ")))
    
    J_sym = sp.Matrix([[sp.diff(eq, var) for var in symbols] for eq in eqs])
    f_func = sp.lambdify(symbols, sp.Matrix(eqs))
    j_func = sp.lambdify(symbols, J_sym)
    
    guess = np.array([float(x) for x in input("Initial guesses: ").split()])
    
    for i in range(50):
        J_eval = np.array(j_func(*guess)).astype(float)
        F_eval = np.array(f_func(*guess)).astype(float).flatten()
        
        delta = np.linalg.solve(J_eval, -F_eval)
        guess += delta
        
        if np.linalg.norm(delta) < 1e-6:
            print(f"Converged Solution: {guess}")
            return

solve_system_jacobian()