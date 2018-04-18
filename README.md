# Numerical Algorithms from Spring 2018
The files in this repository are from Dr. Bechara's mech 105 class in the spring of 2018. The purpose of these files was to explore the various basic numerical methods used for engineering applications. These functions range from applications of Simpson's Method to using LU-factorization.

# Intended Use
These files are intended to be used for evaluating various problems without wasting time and potential accuracy by doing them by hand. It also allows for easy changes to made in order to fit specific needs.

# Function Definitions
Properties of the various functions in this repository.

## falsePosition.m
This function uses the false position method to approximate the roots of input functions around a certain set of initial points.

Inputs:
* func -Function that the users wishes to approximate the root of
* xl   -Lower value of where the root search begins
* xu   -The upper value of where the root search stops
* es   -Desired error of the approximation
* iter -Number of iterations performed

Outputs:
* root -Root approximation
* fx   -Function evaluated at the root
* ea   -Approximate relative error
* iter -Number of iteeration performed

## luFactor.m
This function find the lu-factorization of an input matrix along with the associated pivot matrix.

Inputs:
* a  -Square matrix  for lu-decomposition

Outputs:
* l  -Lower triangular matrix of a
* u  -Upper triangular matrix of a
* p  -Pivot matrix of a

## Simpson.m
This function takes two input vectors and approximates the intergral using simpsons method and trapezoidal method if necessary.

Inputs:
* x  -Matrix of x values
* y  -Matrix of y values

Outputs:
* I  -Intergral approximation
