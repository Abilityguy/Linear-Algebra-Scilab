//m*n matrix
m = int(input("Enter m:"))
n = int(input("Enter n:"))

//Loop which takes the matrix elements through user input
for i = 1:m
    for j = 1:n
        A(i,j) = int(input("Enter value for A["+string(i)+","+string(j)+"]: "))
     end
end


B = rref(A) //B contains the row reduced echelon form
disp("The row reduced form of A:")
disp(B)

[v , pivot ]= rref (A); //Now v contains the rref form and pivot contains the pivots

r = length ( pivot ); 
disp (r , ' Rank of A:') 

cs = A (: , pivot ); 
disp ( cs , ' Column space of  A:'); //prints all columns with pivots

ns = kernel (A); //finds nullspace of A
disp ( ns , ' Null space of A:'); 

rs = v (1: r ,:)';
disp ( rs , 'Row space of A:') //prints all rows with pivots

lns = kernel (A'); //finds null space of A' which is left null space of A
disp ( lns , 'Left nullspace of A:') ;
