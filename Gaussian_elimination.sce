//Program to perform gaussian elimination on square matrices to solve Ax = b if solution exists

n = input("Enter the value of n: ") //n*n matrix
A = eye(n,n) //Initialzing A as an identity matrix

//Loop to take the matrix elements through user input
for i = 1:n
    for j = 1:n
        A(i,j) = int(input("Enter value for A["+string(i)+","+string(j)+"]: "))
     end
end

// Initializing b matrix (Ax = b)
b = eye(n,1)

// Taking matrix elements through user input
for i = 1:n
    b(i,1) = int(input("Enter value for b["+string(i)+","+string(1)+"]: "))
end


//Loop which swaps rows in the matrix that have zero in the pivot position
for i = 1:n
    if(A(i,i) == 0) //if pivot is zero
           j = i+1
           while(A(i,i) == 0 & j < n+1)
               if(A(j,i) ~= 0) //a row with a non zero element in pivot position of the ith row
                   b([j,1],:) = b([i,1],:)
                   A([i,j],:) = A([j,i],:)
               end
               j = j+1
           end
    end
end

//Checking if we have a zero in any pivot position which will cause gaussian breakdown
for i = 1:n
    if(A(i,i) == 0)
        disp("Gaussian elimination will breakdown") 
        abort //exit the program
    end
end

disp("Rearranging the A and b matrices to ensure zero is not in a pivot position ")
disp([A b]) //displaying the augmented matrix

disp("Performing gaussian elimination we get")

for i = 1:n-1
    for j = i+1:n
    //Checking pivots again if we get a zero in pivot during gaussian elimination
       if(A(i,i) == 0)
        k = i+1
           while(A(i,i) == 0 & k < n+1)
               if(A(k,i) ~= 0)
                   b([k,1],:) = b([i,1],:)
                   A([i,k],:) = A([k,i],:)
               end
               k = k+1
           end
        end
    //Gaussian elimination where we make pivot positions in subsequent rows zero
        multiplier = A(j,i)/A(i,i)
        b(j,1) = b(j,1) - multiplier*b(i,1)
        for k = 1:n
           A(j,k) = A(j,k) - multiplier*A(i,k)
        end  
    end 
end

//Gaussian elimination
disp("Final augment matrix after elimination: ")
disp([A b])

//Reducing to a digaonal matrix to solve the linear equation
for i = n:-1:1
    for j = i-1:-1:1
        multiplier = A(j,i)/A(i,i)
        b(j,1) = b(j,1) - multiplier*b(i,1)
    end
end

disp("Now solving and we get values of variables as: (Each variable is denoted by a number): ")

//Reducing to an identity matrix so that variable values would be the modified b matrix
for i = 1:n
    b(i,1) = b(i,1)/A(i,i)
    A(i,i) = 1
end

for i = 1:n
    disp("Variable"+string(i)+" = "+string(b(i,1)))
end
