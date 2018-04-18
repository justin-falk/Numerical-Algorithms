function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%This function is using the false position method to esimate the root of a
%function given the function, upper and lower esitmates, and desired error
%and maximum number of itterations. This will output the root value, the
%function evaluated at the root, the approximate relative error, and the
%performed number of iterations.

%Initializing variables
ea = 100;
root = 0;
%Checking to see if the appropriate nubmer of inputs was entered
if nargin < 3
    error('At least 3 inputs required')
end
%Running a test to see if there is a sign change of the function between
%the entered bounds
signchange = func(xl)*func(xu);

if signchange > 0
    error('No sign change')
end
%Checking to see if the user input less than 5 variables, and if they did
%initalizing the empty fields to a standard value
if nargin < 4 || isempty(es)
    es = .0001;
end
if nargin < 5 || isempty(maxiter)
    maxiter = 200;
end

%Using a while loop to check for when the calculated error becomes less
%than the desired error
while ea > es
    %calculating actual error
    ea = ((xu-((func(xu)*(xl-xu))/(func(xl)-func(xu))))-root)/(xu-((func(xu)*(xl-xu))/(func(xl)-func(xu))))*100;
    for i=1:maxiter
        root = xu-( func(xu)*(xl-xu) )/( func(xl)-func(xu) ); %compute root
        if func(root)==0
            return
        elseif func(root)*func(xl)<0 
            xu=root; %changing upper bound to calculated root if to the left
        else 
            xl=root; %changing lower bound to the root if to the right
        end
    end
    iter = maxiter %displaying number of iterations performed
end
%displaying function evaluated at root and the location of the root itself
fx = doube(func(root))
root = double(root)
end

