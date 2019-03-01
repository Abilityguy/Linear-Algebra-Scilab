////Program to find the inverse of the given square matrix through Gauss-Jordan elimination

n = input("Enter the value of n: ")//n*n matrix
A = eye(n,n)//Initialzing A as an identity matrix

//Loop to take the matrix elements through user input
for i = 1:n
    for j = 1:n
        A(i,j) = int(input("Enter value for A["+string(i)+","+string(j)+"]: "))
     end
end

B = eye(n,n) //Initializing the inverse of the matrix

//Loop to copy the A matrix into C matrix
C = eye(n,n)
for i=1:n
    for j=1:n
        C(i,j)=A(i,j)
    end
end

disp("The augmented matrix is: ")
disp([A B])

//Loop which exchanges rows in the matrix that have zero in the pivot position
for i = 1:n
    if(A(i,i) == 0)
           j = i+1
           while(A(i,i) == 0 & j < n+1)
               if(A(j,i) ~= 0)
                   for k = 1:n
                       A([i,k],:) = A([j,k],:)
                       B([i,j],:) = B([j,i],:)
                   end
               end
               j = j+1
           end
    end
end

//Checking if we have a zero in any pivot position which will cause gaussian breakdown
for i = 1:n
    if(A(i,i) == 0)
        disp("Gaussian elimination breaks down and the inverse of the matrix does not exist")
        abort //exit the program
    end
end

//peforming gaussian elimination
for i = 1:n-1
    for j = i+1:n
    //Checking pivots again if we get a zero in pivot during gaussian elimination
       if(A(i,i) == 0)
        k = i+1
           while(A(i,i) == 0 & k < n+1)
               if(A(k,i) ~= 0)
                   B([i,k],:) = B([k,i],:)
                   A([i,k],:) = A([k,i],:)
               end
               k = k+1
           end
        end
    //Gaussian elimination where we make pivot positions in subsequent rows zero
        multiplier = A(j,i)/A(i,i)
        for k = 1:n
           A(j,k) = A(j,k) - multiplier*A(i,k)
           B(j,k) = B(j,k) - multiplier*B(i,k)
        end  
    end 
end

disp("The augmented matrix after gaussian elimination:")
disp([A B])

//Converting the A matrix into a diagonal matrix
for i = n:-1:1
    for j = i-1:-1:1
    multiplier = A(j,i)/A(i,i) 
       for k = n:-1:1
          A(j,k) = A(j,k) - multiplier*A(i,k)
          B(j,k) = B(j,k) - multiplier*B(i,k)
       end
    end 
end

//Converting A into an identity matrix, now B is the inverse matrix
for i=1:n
    for j=1:n
        B(i,j) = B(i,j)/A(i,i)
    end
    A(i,i) = 1
end

disp("After Gauss Jordan elimination we get the augment matrix as: ")
disp([A B])

disp("The inverse of A is: ")
disp(B)

disp("The inverse of A using built in function: ")
disp(inv(C))
