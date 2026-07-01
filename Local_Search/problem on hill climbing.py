import random

def f(x):
    return -(x - 3) ** 2 + 9

def hill_climbing(max_iterations=1000, step_size=0.1, lower_bound=-10, upper_bound=10):
    current_x = random.uniform(lower_bound, upper_bound)
    current_value = f(current_x)

    for _ in range(max_iterations):
        next_x = current_x + random.choice([-step_size, step_size])
        if next_x < lower_bound or next_x > upper_bound:
            continue
        next_value = f(next_x)
        if next_value > current_value:
            current_x, current_value = next_x, next_value

    return current_x, current_value

best_x, best_value = hill_climbing()
# print("Best solution found:")
print(round(best_x))
# print("f(X) =", round(best_value, 4))
