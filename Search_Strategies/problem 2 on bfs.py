from collections import deque


graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'E'],
    'D': ['B', 'E'],
    'E': ['C', 'D']
}


def bfs(graph, start):
    visited = []
    queue = deque([start])

    while queue:
        node = queue.popleft()
        if node not in visited:
            visited.append(node)
            for neighbor in graph[node]:
                if neighbor not in visited and neighbor not in queue:
                    queue.append(neighbor)
    return visited


traversal = bfs(graph, 'A')
print("BFS Traversal:", ' '.join(traversal))
