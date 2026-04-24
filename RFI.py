import sympy as sp

def regula_falsi():
    expr_str = input("Enter function f(x): ")
    a = float(input("Enter lower bound (a): "))
    b = float(input("Enter upper bound (b): "))
    tol = 1e-6

    x = sp.symbols('x')
    f = sp.lambdify(x, sp.sympify(expr_str))

    if f(a) * f(b) >= 0:
        print("Method fails: f(a) and f(b) must have opposite signs.")
        return

    for i in range(100):
        c = (a * f(b) - b * f(a)) / (f(b) - f(a))
        if abs(f(c)) < tol:
            break
        if f(a) * f(c) < 0:
            b = c
        else:
            a = c
            
    print(f"Root found: {c:.6f}")

regula_falsi()