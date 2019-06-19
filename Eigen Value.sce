//A program to find the eigen values of a matrix

A = input("Enter A(square matrix): ");
[n,n]=size(A);

//defining a  polynomial
lam = poly(0,'lam');

//Eigen value - roots( |A - lamda*I| )
disp("Eigen Values: ");
e = roots(det(A - lam*eye(n,n)));
disp(e);

//Eigen vectors - null space(A - lambda*I)
disp("Eigen Vectors: ");
for i=1:length(e)
    k = A-e(i)*eye(n,n);
    disp(kernel(k));
end
