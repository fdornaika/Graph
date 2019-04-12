This folder includes a matlab code that estimates the directed graph matrix using the 
 the Sparse Graph with Smoothness Constraints  (SGLS) method.



The main function can be called using 

 [W, err,itt] = construct_W_sgls (data, W0, lambda, rho).

When using the kernel variant the call should be [W,err,itt] = construct_W_sgls (K,W0,lambda,rho) 
where K is a squared matrix that represents the kernel matrix assossiated with the data matrix.



%%Input: 
%    data       ==  data matrix where  each observation is a column

%    W0         ==  initial graph matrix

%    lambda, rho ==  regularization  parameters (two positive numbers)


%%Output:

%   W    ==  directed graph matrix

%   err  ==  Array of graph differences at two consecutive iterations (L2 norm of a matrix)

%   itt  == array that saves the number of iterations of the ADMM at each external iteration



