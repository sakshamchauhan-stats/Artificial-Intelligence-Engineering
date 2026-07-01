import random

def f(x):
    return -(x - 3) ** 2 + 9

def init_population(size, lower_bound=-10, upper_bound=10):
    return [random.uniform(lower_bound, upper_bound) for _ in range(size)]

def selection(population):
    return max(random.sample(population, 2), key=f)

def crossover(p1, p2):
    alpha = random.random()
    return alpha * p1 + (1 - alpha) * p2

def mutation(x, lower_bound=-10, upper_bound=10, rate=0.1):
    if random.random() < rate:
        x += random.uniform(-1, 1)
        x = max(lower_bound, min(upper_bound, x))
    return x

def genetic_algorithm(pop_size=20, generations=100, mutation_rate=0.1):
    population = init_population(pop_size)
    for _ in range(generations):
        new_population = []
        for _ in range(pop_size):
            p1, p2 = selection(population), selection(population)
            child = crossover(p1, p2)
            child = mutation(child, rate=mutation_rate)
            new_population.append(child)
        population = new_population
    best = max(population, key=f)
    return best, f(best)

best_x, best_value = genetic_algorithm()
# print("Best solution found:")
print(round(best_x))
# print("f(X) =", round(best_value, 4))
