def lagrange_interpolation(x_pts, y_pts, target):
    n = len(x_pts)
    result = 0.0
    
    for i in range(n):
        term = y_pts[i]
        for j in range(n):
            if i != j:
                term *= (target - x_pts[j]) / (x_pts[i] - x_pts[j])
        result += term
    return result

x_values = [float(i) for i in input("Enter x values: ").split()]
y_values = [float(i) for i in input("Enter y values: ").split()]
target = float(input("Enter target value: "))
interpolated_y = lagrange_interpolation(x_values, y_values, target)

print(f"The interpolated value at x = {target} is {interpolated_y:.2f}")