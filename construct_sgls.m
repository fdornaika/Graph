function [W, err, itt] = construct_W_sgls (data,W0,lambda,rho)

%% construct W matrix based on the SGLS criterion

%%Inputs 
%    data       == Data amtrix where  each observation should be a column
%    W0         ==  Initial rough similarity matrix (random matrix or KNN graph)
%    lambda, rho ==  Regularization parameters


%%Output
%   W   ==  Directed graph matrix
%   err  ==  Array of graph differences at two consecutive iterations (L2 norm of a matrix)
%   itt  == Array that saves the number of iterations of the ADMM at each external ieration



%% Input checking
if nargin <3
    lambda  = 1;
end
if nargin <4
    rho     = 1;
    lambda  = 1;
end

%% Normalizing data
norm_val = sqrt(sum(data.^2));
data = data ./ repmat(norm_val,size(data,1),1);

%% Prealocation
[~,nSmp] = size(data);
err = [];
B_pre = W0;
B_new = zeros(nSmp);
itt = [];
T_th = 1e-4;


%% main process
 for epoch = 1:3
    Wnew = B_pre;
    Wnew = Wnew ./ repmat(sum(Wnew,2),1,nSmp);
    Lnew = diag(sum(Wnew))+diag(sum(Wnew,2))-Wnew-Wnew';
    [B_new,ite] = lasso_admm(data, Lnew, lambda, rho, T_th);
    itt = [itt;ite];
    W_new = B_new ./ repmat(sum(B_new,2),1,nSmp);
    T = abs(W_new - Wnew);
    Ts = sum(sum(T.^2));
    err = [err;Ts];
     if(Ts<10^-6)
        break;
     end
    B_pre = abs(B_new);
 end
W = abs(B_new);