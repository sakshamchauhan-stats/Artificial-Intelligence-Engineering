graph = {
    'A': {'B':4,'C':2},
    'B': {'A':4,'D':5},
    'C': {'D':8,'A':2,'E':3},
    'D': {'C':8,'B':5,'E':2},
    'E': {'C':3,'D':2,'F':1},
    'F': {'E':1}
    }

heuristic = {
    'A':7,
    'B':6,
    'C':3,
    'D':1,
    'E':2,
    'F':0    
    }

graph2 = {
    'S': {'A': 2, 'B': 5},
    'A': {'S': 2, 'C': 3, 'D': 10},
    'B': {'S': 5, 'E': 3, 'D': 2},
    'C': {'A': 3, 'F': 3},
    'D': {'A': 10, 'B': 2, 'F': 7, 'H': 2},
    'E': {'B': 3, 'G': 2},
    'F': {'C': 3, 'D': 7, 'I': 2},
    'G': {'E': 2, 'H': 6, 'I': 1},
    'H': {'D': 2, 'G': 6},
    'I': {'F': 2, 'G': 1, 'T': 2},
    'T': {'I': 2}
}

heuristic2 = {
    'A':9,
    'S':10,
    'C':8,
    'E':5,
    'B':7,
    'D':6,
    'F':3,
    'G':4,
    'H':2,
    'I':1,
    'T':0    
    }


from queue import PriorityQueue

def gbfs(graph, heuristic ,start, goal):
    visited = []
    pq = PriorityQueue()  
    pq.put((heuristic[start],start))## the queue will be initialised as [(0,'F')]
    # print(list(pq.queue))
    
    parent = {start:None}
    g_cost = {start:0}
    
    while not pq.empty():  ## change because pq objects are always truthful
        
        # print("my pq is: ", pq.queue)
        # print("parent dict is: ", parent)
        # print("g_cost is: ", g_cost)
    
        _, node = pq.get()  ##as i am using pq
        
        
        if node == goal:
            visited.append(node)
            break
        if node not in visited:
            # print("node is: ", node)
            visited.append(node)
            # print("visited is ",visited)
            # print("********")
            for neighbor in sorted(list(graph[node].keys())):
                if (neighbor not in visited) and (neighbor not in [item for _,item in pq.queue]):
                    parent[neighbor] = node ## to allow for back tracking the parent
                    #g_cost[neighbor] = g_cost[node] + graph[node][neighbor] ## adding the edge costs
                    g_cost[neighbor] = g_cost[node] + graph[node][neighbor]
                    pq.put((heuristic[neighbor],neighbor))
                    
                    
    path = []
    cur = goal
    if cur in parent:
        while cur is not None:
            path.append(cur)
            cur = parent[cur]  
    path.reverse()        
    
    # cost = g_cost[goal]
    cost = 0
    for i in range(len(visited)):
        if visited[i] == goal:
            break
        cost = cost + graph[visited[i]][visited[i+1]]
    
    return(visited, path, cost)  ## or cost is to be returned
 
traversal, path, cost = gbfs(graph, heuristic, 'A', 'F')
# print("GBFS Traversal: ",traversal)
# print("Path is: ", path)
# print("Cost is: ", cost)


traversal2, path2, cost2 = gbfs(graph2, heuristic2, 'S', 'T')
# print("GBFS Traversal: ",traversal)
# print("Path is: ", path)
print("Cost is: ", cost2)
