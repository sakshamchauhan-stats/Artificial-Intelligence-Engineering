import random

N = 8

def random_state():
    return [random.randint(0, N-1) for _ in range(N)]

def attacking_pairs(state):
    attacks = 0
    for i in range(N):
        for j in range(i+1, N):
            if state[i] == state[j] or abs(state[i]-state[j]) == abs(i-j):
                attacks += 1
    return attacks

def get_neighbors(state):
    neighbors = []
    for col in range(N):
        for row in range(N):
            if state[col] != row:
                neighbor = state.copy()
                neighbor[col] = row
                neighbors.append(neighbor)
    return neighbors

def hill_climbing_with_restarts(max_iterations=1000, max_restarts=100):
    for _ in range(max_restarts):
        current = random_state()
        current_attacks = attacking_pairs(current)
        for _ in range(max_iterations):
            if current_attacks == 0:
                return current, current_attacks
            neighbors = get_neighbors(current)
            next_state = min(neighbors, key=attacking_pairs)
            next_attacks = attacking_pairs(next_state)
            if next_attacks < current_attacks:
                current, current_attacks = next_state, next_attacks
            else:
                break
    return current, current_attacks

solution, attacks = hill_climbing_with_restarts()
print("Solution:", solution)
print("Attacking pairs:", attacks)
