import random

N = 8

def attacking_pairs(state):
    attacks = 0
    for i in range(N):
        for j in range(i+1, N):
            if state[i] == state[j] or abs(state[i]-state[j]) == abs(i-j):
                attacks += 1
    return attacks

def fitness(state):
    return -attacking_pairs(state)

def random_state():
    return [random.randint(0, N-1) for _ in range(N)]

def selection(population):
    return max(random.sample(population, 2), key=fitness)

def crossover(p1, p2):
    point = random.randint(1, N-2)
    child = p1[:point] + p2[point:]
    return child

def mutation(state, rate=0.1):
    if random.random() < rate:
        col = random.randint(0, N-1)
        row = random.randint(0, N-1)
        state[col] = row
    return state

def genetic_algorithm(pop_size=50, generations=1000, mutation_rate=0.2):
    population = [random_state() for _ in range(pop_size)]
    for _ in range(generations):
        new_population = []
        for _ in range(pop_size):
            p1, p2 = selection(population), selection(population)
            child = crossover(p1, p2)
            child = mutation(child, mutation_rate)
            new_population.append(child)
        population = new_population
        best = max(population, key=fitness)
        if attacking_pairs(best) == 0:
            return best
    return best

solution = genetic_algorithm()
# print("Solution:", solution)
print("Attacking pairs:", attacking_pairs(solution))
print("Solution found")
