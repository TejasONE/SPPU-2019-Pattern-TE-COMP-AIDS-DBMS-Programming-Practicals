n = int(input("Enter n: "))

matrix = [['0' for _ in range(n)] for _ in range(n)]

def isSafe(matrix,x,y,n):
    for i in range(n):
        if matrix[i][y] == 'Q':
            return False
        
    for i in range(n):
        if matrix[x][i] == 'Q':
            return False
          
    i=0     # to the upper left
    while x-i>=0 and y-i>=0:
        if matrix[x-i][y-i] == 'Q':
            return False
        i+=1

    i=0    # to the lower right
    while x-i>=0 and y+i<n:
        if matrix[x-i][y+i] == 'Q':
            return False
        i+=1
        
    i=0    # to the 
    while x+i<n and y-i>=0:
        if matrix[x+i][y-i] == 'Q':
            return False
        i+=1
     
    i=0   
    while x+i<n and y+i<n:
        if matrix[x+i][y+i] == 'Q':
            return False
        i+=1
            
    return True

def place_queen(matrix, count,n):
    if count == n:
        return True
        
    for i in range(n):
        for j in range(n):
            
            if isSafe(matrix,i,j,n):    # if true place queen
                matrix[i][j] = 'Q'

                if place_queen(matrix,count+1,n): 
                    return True
                matrix[i][j] = '0'
            
    return False
    
    
print(place_queen(matrix,0,n))
for i in range(n):
    for j in range(n):
        print(matrix[i][j]," ",end='')
    print()