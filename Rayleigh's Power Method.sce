//Program to find the largest eigen value and eigen vector using Rayleigh power method

A = input("Enter A(square matrix): ");
[n,n]=size(A);

//initial X - X(0)
Ax = eye(n,1)

//initializing prev_Ax
prev_Ax = zeros(n,1)

//Performing successive iterations to find the largest eigen vector and eigen value
while(sum(Ax - prev_Ax) > 10**-6) do
    prev_Ax = Ax
    Ax = A*Ax
    lam = max(abs(Ax))
    Ax = Ax/lam
    disp(Ax)
end

disp("Largest Eigen Value: ")
disp(lam)
disp("Largest Eigen Vector: ")
disp(Ax)
