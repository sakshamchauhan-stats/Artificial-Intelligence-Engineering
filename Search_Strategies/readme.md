## Search Strategies in AI

This repository contains implementations of classical AI search algorithms as part of my M.Tech in AI & Data Science. The focus is on understanding how different search strategies explore problem spaces and the trade-offs between them.

### Overview

Search algorithms form the backbone of many AI systems, including pathfinding, planning, and state-space exploration. This repository implements and compares key uninformed and informed search techniques.

### Algorithms Implemented

#### Uninformed Search
- Breadth-First Search (BFS)
- Depth-First Search (DFS)

#### Informed Search
- Greedy Best-First Search (GBFS)
- A* Search Algorithm

### Key Learnings

- BFS explores nodes level by level using a queue and guarantees the shortest path in unweighted graphs.
- DFS explores as deep as possible before backtracking and is naturally suited for recursive implementations.
- GBFS uses heuristics to guide the search toward the goal more efficiently but may not guarantee optimal solutions.
- A* combines actual path cost and heuristic estimates to find optimal solutions efficiently under admissible heuristics.

### Concepts Covered

- Graph traversal techniques
- State-space search
- Heuristic-based search
- Time and space complexity trade-offs
- Optimality vs efficiency in AI search

### Purpose

The goal of this repository is to build a strong understanding of foundational AI search techniques and how intelligent agents explore and solve problems in structured environments.

---

These implementations serve as a learning exercise in classical AI problem-solving and algorithm design.
