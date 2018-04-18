function [I] = Simpson(x,y)
%This function takes to input vectors, x and y, checkes several parameters
%for accuracy and consistency then uses either simpsons 1/3 rule or
%simpsons 1/3 rule with trapezoidal rue to evaluate an approximate
%intergral of the values.

%Checknig for correct number of inputs
if nargin ~= 2
    error('Use the correct number of inputs')
end
%Checking to make sure inputs are correctly sized
size_check = length(x)/length(y);
if length(x) < 3 || length(y) < 3
    error('X or Y is too small')
end
%Checking to see if inputs are the same length
if size_check ~= 1
    error('Inputs are not the same length')
end
%Cehcking to see if trapezoidal rule will need to be applied by analyzing
%the remainder after division
if rem(length(x),2) == 1
    warning('Trapezoid rule will be applied')
end
%Checking for equal spacing among the x values
x_temp = linspace(x(1),x(end),length(x));
if isequal(x,x_temp) == 0
    error('Inputs are not equally spaced')
end
%Initializing variables for later use
a = x(1);
b = x(end);
h = (b-a)/length(x);
%Calculating the approximate value through either Simpson's 1/3 or a
%composite form. Composite is the after the elseif.
if rem(length(x),2) == 0
    I = (h/3)*(y(1)+2*sum(y(3:2:end-2))+4*sum(y(2:2:end))+y(end));
elseif rem(length(x),2) == 1
    I = (h/3)*(y(1)+2*sum(y(3:2:end-2))+4*sum(y(2:2:end))+((y(end)+y(end-1))*(x(2)-x(1)))/2);
end


end

