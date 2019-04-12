This folder includes a matlab code that estimates the directed graph matrix using the 
 the Sparse Graph with Smoothness Constraints  (SGLS) method.



The main function can be called using 

 [W, err,itt] = construct_W_sgls (data, W0, lambda, rho).

The  kernel variant of the SGLS can be used by changing the first input. 
 The call should be [W, err, itt] = construct_W_sgls (K, W0,lambda,rho) 
where K is a square matrix that represents the kernel matrix assossiated with the data matrix.



%%Input: 

%    data       ==  Data matrix where  each observation is a column

%    W0         ==  Initial graph matrix

%    lambda, rho ==  Regularization  parameters (two positive numbers)


%%Output:

%   W    ==  Directed graph matrix

%   err  ==  Array of graph differences at two consecutive iterations (L2 norm of a matrix)

%   itt  == Array that stores the number of iterations of the ADMM at each external iteration



