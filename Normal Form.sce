//Program to find the solution to a system of equations through the normal equation of a matrix

A = input("Enter matrix A: ")
b = input("Enter matrix b: ")

//normal equation - A'.A.x = A'.b

//Solving for x = inv(A'.A)A'.b
disp("X: ")
disp(inv(A'*A)*A'*b)
