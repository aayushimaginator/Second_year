def simpson38(f, a, b, n):
    if n % 3 != 0: raise ValueError("n must be a multiple of 3.")
    h = (b - a) / n
    x = [a + i*h for i in range(n+1)]
    y = [f(val) for val in x]
    
    integral = y[0] + y[-1]
    for i in range(1, n):
        multiplier = 2 if i % 3 == 0 else 3
        integral += multiplier * y[i]
        
    return (3 * h / 8) * integral

func = lambda x: 1 / (1 + x**2)
print("Simpson's 3/8:", simpson38(func, 0, 1, 6))