import sympy as sp

def bisection():
    expr_str = input("Enter function f(x): ")
    a = float(input("Enter lower bound (a): "))
    b = float(input("Enter upper bound (b): "))
    tol = float(input("Enter tolerance (e.g., 1e-6): "))

    x = sp.symbols('x')
    f = sp.lambdify(x, sp.sympify(expr_str))

    if f(a) * f(b) >= 0:
        print("Bisection method fails: f(a) and f(b) must have opposite signs.")
        return

    while (b - a) / 2 > tol:
        mid = (a + b) / 2
        if f(mid) == 0:
            break
        if f(a) * f(mid) < 0:
            b = mid
        else:
            a = mid
    
    print(f"Root found: {(a + b) / 2:.6f}")