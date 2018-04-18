function [l,u,p] = luFactor(a)
%The luFactor function takes in a 3x3 square matrix called a, and outputs
%the upper tirangular matrix u, the lower triangular matrix l, and the
%pivot matrix p.
%House Kepping
clc
%Checking for number of inputs
if nargin ~= 1
    error('Wrong number of inputs');
end
%Defining input matrix
a_original = a;
%Defining pivot matrix
p = [1 0 0; 0 1 0; 0 0 1];
%Initializing Values and format of the lower triangular matrix
c = 0; d = 0; e = 0;
l = [1 0 0; c 1 0; d e 1];
%Checking to see if input matrix is a square
s = size(a);
if s(1) ~= s(2)
    error('Matrix is not square')
end
%storing each row value for indexing
row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);
%Checking for pivoting in the first two rows
if abs(a(2,1)) > abs(a(1,1))
    a(1,:) = row_a2;
    a(2,:) = row_a1;
    p(1,:) = row_p2;
    p(2,:) = row_p1;
    l(1,:) = row_l2;
    l(2,:) = row_l1;
end
%Reassigning values to keep matrix updated
row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);
%Checking for third and first row pivoting
if abs(a(3,1)) > abs(a(1,1))
    a(1,:) = row_a3;
    a(3,:) = row_a1;
    p(1,:) = row_p3;
    p(3,:) = row_p1;
    l(1,:) = row_l3;
    l(3,:) = row_l1;
end
%Reassigning values to keep matrix updated
row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);
%Checking for third and second row pivoting
if abs(a(3,1)) > abs(a(2,1))
    a(2,:) = row_a3;
    a(3,:) = row_a2;
    p(2,:) = row_p3;
    p(3,:) = row_p2;
    l(2,:) = row_l3;
    l(3,:) = row_l2;
end
%Reassigning values to keep matrix updated
row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);
%Determining a common factor to multiply by so we can subtract and cancel
%out a column value in the second row
c = a(2,1)/a(1,1);
row_a1c = c*a(1,:);
a(2,:) = a(2,:) - row_a1c;
%Reassigning values to keep matrix updated
row_a2 = a(2,:);
%Determining a common factor to multiply by so we can subtract and cancel
%out a column value in the second third
d = a(3,1)/a(1,1);
row_a1elim = d*a(1,:);
a(3,:) = a(3,:) - row_a1elim;
%Reassigning values to keep matrix updated
row_a3 = a(3,:);
%Checking for necessary pivoting
if abs(a(3,2)) > abs(a(2,2))
    a(2,:) = row_a3;
    a(3,:) = row_a2;
    p(2,:) = row_p3;
    p(3,:) = row_p2;
    l(2,:) = row_l3;
    l(3,:) = row_l2;
end
%Reassigning values to keep matrix updated
row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);

%Determining a common factor to multiply by so we can subtract and cancel
%out a column value in the second column
e = a(3,2)/a(2,2);
row_a3elim = e*a(2,:);
a(3,:) = a(3,:) - row_a3elim;
row_a2 = a(2,:);


    

row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);
%Calculating values for l, u, and the value of l * u
l = [1 0 0; c 1 0; d e 1];
u = a;
lu = l * u;
disp(p)
%Checking for any last necessary pivoting
if lu ~= a_original
    a(1,:) = row_a2;
    a(2,:) = row_a1;
    p(1,:) = row_p2;
    p(2,:) = row_p1;
    l(1,:) = row_l2;
    l(2,:) = row_l1;
end
%Reupdating the values of the a matrix
row_a1 = a(1,:); row_a2 = a(2,:); row_a3 = a(3,:);
row_p1 = p(1,:); row_p2 = p(2,:); row_p3 = p(3,:);
row_l1 = l(1,:); row_l2 = l(2,:); row_l3 = l(3,:);
%Displaying if factorization was accurate
if lu == a_original
    disp('Accurate Factorization')
else
    disp('Inaccurate Factorization')
end

end

