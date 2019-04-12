% Function to perform LASSO regression using Alternating Direction Method
% of Multipliers.
%
% arg min_{B} 0.5*||X - X*B||_{2}^{2} + lambda*||B||_{1} + rho * trace(B * L * B')
%
% Usage:- [B,cost] = lasso_admm(X, L, lambda, rho) 
%
% where:- <in>
%         B = solution  
%
% Edited by Joe 2014 5th Nov.

function [B,ite] = lasso_admm(X, L, lambda, rho, th)

% Get dimensions of B
c = size(X,2); 

M = zeros(c); % Initialize Lagragian to be nothing (seems to work well)
gamma = 1e-4; % Set gamma to be quite low to start with 
maxIter = 1e6; % Set the maximum number of iterations (make really big to ensure convergence)
I = eye(c); % Set the sparse identity matrix
maxRho = 5; % Set the maximum mu
C = randn(c,c); % Initialize C randomly
TSmax = th*c*c;

% Set the fast soft thresholding function
fast_sthresh = @(x,th) sign(x).*max(abs(x) - th,0);

for n = 1:maxIter
        
    % Solve sub-problem to solve B
    B = lyap(X'*X + gamma * I, 2*rho*L, M-X'*X - gamma * C);
    
    % Solve sub-problem to solve C
    C = fast_sthresh(B + M/gamma, lambda/gamma); 
    
    TS = abs(B - C);
    if sum(sum(TS))<TSmax
        break;
    end
    % Update the Lagrangian
    M = M + gamma*(B - C);  
    
    %pause; 
    
    % Section 3.3 in Boyd's book describes strategies for adapting rho
    % main strategy should be to ensure that 
    gamma = min(maxRho, gamma*1.1); 
    
    
end

ite = n;
