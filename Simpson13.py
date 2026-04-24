def simpson13(f, a, b, n):
    if n % 2 != 0: raise ValueError("n must be even.")
    h = (b - a) / n
    x = [a + i*h for i in range(n+1)]
    y = [f(val) for val in x]
    
    integral = y[0] + y[-1]
    for i in range(1, n):
        multiplier = 4 if i % 2 != 0 else 2
        integral += multiplier * y[i]
        
    return (h / 3) * integral

func = lambda x: 1 / (1 + x**2)
print("Simpson's 1/3:", simpson13(func, 0, 1, 6))