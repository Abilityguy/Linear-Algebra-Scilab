//Program to factorize the given square matrix A in upper and lower triangular matrices

n = int(input("Enter n: "))//n*n matrix
A = eye(n,n)//Initialzing A as an identity matrix

//Loop to take the matrix elements through user input
for i = 1:n
    for j = 1:n
        A(i,j) = int(input("Enter value for A["+string(i)+","+string(j)+"]: "))
     end
end

//Loop to copy the A matrix into a to-be upper triangular matrix u
u = eye(n,n)
for i=1:n
    for j=1:n
        u(i,j)=A(i,j)
    end
end


//Loop which exchanges rows in the matrix that have zero in the pivot position
for i = 1:n
    if(u(i,i) == 0) //if pivot is zero
           j = i+1
           while(u(i,i) == 0 & j < n+1)
               if(u(j,i) ~= 0) //a row with a non zero element in pivot position of the ith row
                  u([i,j],:) = u([j,i],:)
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

l = eye(n,n) // initialzing our to-be lower triangular matrix
p = eye(n,n) //Initializing a permutation matrix which takes care of row exchanges

for i = 1:n-1
    //Checking pivots again if we get a zero in pivot during gaussian elimination
    for j = i+1:n
        if(A(i,i) == 0)
           k = i+1
           while(A(i,i) == 0 & k < n+1)
               if(A(k,i) ~= 0)
                   p([i,k],:) = p([k,i],:)
                   l([(k,1),:]) = l([(i,1),:])
                   A([i,k],:) = A([k,i],:)
               end
               k = k+1
           end
        end
        //Gaussian elimination where we make pivot positions in subsequent rows zero
        multiplier = A(j,i)/A(i,i)
        l(j,i) = multiplier
        for k = 1:n
           A(j,k) = A(j,k) - multiplier*A(i,k)
        end
    end 
end

//Checking if gaussian elimination has produced a zero in pivot position
for i = 1:n
    if(A(i,i) == 0)
        disp("Gaussian elimination will breakdown")  
        abort
    end
end


disp("Performing LU factorization on the above matrix yeilds:")
disp("L: ")
disp(l)
disp("U:")
disp(u)
disp("We get PA: ")
disp(p*A)
disp("Performing LU we get:")
disp(l*u)




                                                                                                                                         
