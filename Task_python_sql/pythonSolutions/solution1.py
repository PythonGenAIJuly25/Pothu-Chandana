def task_scheduler(tasks, dependencies):
    graph = {task: [] for task in tasks}
    in_degree = {task: 0 for task in tasks}
    
    for task, prerequisite in dependencies:
        graph[prerequisite].append(task)
        in_degree[task] += 1
 
    queue = []
    for task in tasks:
        if in_degree[task] == 0:
            queue.append(task)
    
    result = []
    

    while queue:
        current_task = queue.pop(0)
        result.append(current_task)
        
       
        for neighbor in graph[current_task]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
    
   
    if len(result) == len(tasks):
        return result
    else:
        return None  


# Test Cases
if __name__ == "__main__":
    # Test Case 1: Valid dependency chain
    tasks1 = ["A", "B", "C", "D"]
    dependencies1 = [("B", "A"), ("C", "B"), ("D", "A")]
    print("Test 1:", task_scheduler(tasks1, dependencies1))
    # Expected: ["A", "B", "C", "D"] or ["A", "D", "B", "C"]
    
    # Test Case 2: Circular dependency
    tasks2 = ["X", "Y", "Z"]
    dependencies2 = [("Y", "X"), ("Z", "Y"), ("X", "Z")]
    print("Test 2:", task_scheduler(tasks2, dependencies2))
    # Expected: None
    
    # Test Case 3: No dependencies
    tasks3 = ["P", "Q", "R"]
    dependencies3 = []
    print("Test 3:", task_scheduler(tasks3, dependencies3))
    # Expected: ["P", "Q", "R"] (any order)
    
    # Test Case 4: Complex valid case
    tasks4 = ["compile", "test", "deploy", "build", "package"]
    dependencies4 = [
        ("test", "compile"),
        ("deploy", "package"),
        ("package", "build"),
        ("build", "compile")
    ]
    print("Test 4:", task_scheduler(tasks4, dependencies4))
    # Expected: ["compile", "test", "build", "package", "deploy"] (or similar valid order)