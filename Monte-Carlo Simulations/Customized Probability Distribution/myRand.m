function x = myRand(n)
% Inputs:
% n: sample size of data pool
% Outputs:
% x: random sample from p(x) given in the problem statement
y = rand(n,1);
x = -3*(sqrt(-(y)+1)-1);