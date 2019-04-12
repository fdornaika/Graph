This folder includes a matlab code for estimating the directed graph matrix based on
 the Sparse Graph with Smoothness Constraints (SGLS).

The main function is called  construct_W_sgls().

This function can be called using 

 [W, err,itt] = construct_W_sgls (data, W0, lambda, rho).

When using the kernel variant the call should be [W,err,itt] = construct_W_sgls (K,W0,lambda,rho) 
where K is a squared matrix that represents the kernel matrix assossiate with the data matrix.



%%Input: 
%    data       ==  data matrix where  each observation is a column
%    W0         ==  initial graph matrix
%    lambda, rho ==  regularization  parameters (two positive numbers)


%%Output:
%   W    ==  directed graph matrix
%   err  ==  Array of graph differences at two consecutive iterations (L2 norm of a matrix)
%   itt  == array that saves the number of iterations of the ADMM at each exteranl iteration



