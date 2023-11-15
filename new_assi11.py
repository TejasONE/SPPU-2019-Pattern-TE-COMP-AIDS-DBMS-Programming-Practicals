nodes = {}

no_of_nodes = int(input("Enter the no. of nodes: "))
no_of_edges = int(input("Enter the no. of edges: "))

for i in range(no_of_nodes):
    name = input("Enter the nodes: ")
    nodes[name] = i

adj_mat = [[0 for i in range(no_of_nodes)] for i in range(no_of_nodes)] #making matrix of zeros
print (adj_mat)  # for me
print("\n")

for i in range(no_of_edges):
    n1 = input("start: ")
    n2 = input("destination: ")

    adj_mat[nodes[n1]][nodes[n2]] = 1
    adj_mat[nodes[n2]][nodes[n1]] = 1

print("\n")
queue = [] #fifo
start_node = input("enter start node: ")
print("bfs: ",end="")

queue.append(start_node)
visited = [0 for i in range(no_of_nodes)] #all zeros
print(visited) # for me
visited[nodes[start_node]] = 1


while len(queue) != 0:
    front = queue[0]
    queue.pop(0)
    print(front,end="")
    for name,i in nodes.items():
        if adj_mat[nodes[front]] [i]==1 and visited[i]==0:
            queue.append(name)
            visited[i] = 1

print("\n")
stack = [] #filo
start_node = input("enter start node: ")
print("dfs: ",end="")

stack.append(start_node)
visited = [0 for i in range(no_of_nodes)] #all zeros
visited[nodes[start_node]] = 1

while len(stack)!=0:
    last = stack[-1]
    stack.pop()
    print(last,end="")
    for name,i in nodes.items():
        if adj_mat[nodes[last]][i]==1 and visited[i]==0:
            stack.append(name)
            visited[i] = 1