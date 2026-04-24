import sympy as sp

def secant():
    expr_str = input("Enter function f(x): ")
    x0 = float(input("Enter x0: "))
    x1 = float(input("Enter x1: "))
    tol = 1e-6

    x = sp.symbols('x')
    f = sp.lambdify(x, sp.sympify(expr_str))

    for i in range(100):
        if abs(f(x1) - f(x0)) < 1e-10:
            break
        x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0))
        if abs(x2 - x1) < tol:
            print(f"Root found: {x2:.6f}")
            return
        x0, x1 = x1, x2

secant()