values = [10,5,7,11,12,8,9,8,5,12,11,12,9,8,7,10] 

flag = False
while len(values) != 1:
    if flag:
        for i in range(0,len(values),2):
            values[i] = max(values[i],values[i+1])
            flag = False
        
    else:
        for i in range(0,len(values),2):
            values[i]=min(values[i],values[i+1])
        flag = True
            
    values = [j for i,j in enumerate(values) if i%2==0]
    
    print(values)

'''
OUTPUT : 

[10, 11, 12, 9, 12, 12, 9, 10]
[10, 9, 12, 9]
[10, 12]
[10]
    '''