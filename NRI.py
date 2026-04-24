import sympy as sp

def newton_raphson():
    expr_str = input("Enter function f(x): ")
    x0 = float(input("Enter initial guess: "))
    
    x = sp.symbols('x')
    f_sym = sp.sympify(expr_str)
    df_sym = sp.diff(f_sym, x)
    
    f = sp.lambdify(x, f_sym)
    df = sp.lambdify(x, df_sym)
    
    xn = x0
    for i in range(50):
        if abs(df(xn)) < 1e-10:
            print("Derivative too small.")
            return
        xn_next = xn - f(xn) / df(xn)
        if abs(xn_next - xn) < 1e-6:
            print(f"Root found: {xn_next:.6f}")
            return
        xn = xn_next

newton_raphson()