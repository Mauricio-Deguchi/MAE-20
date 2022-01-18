function [xStar, xRoot] = fixPoint ( fun2, x0, tol, maxIter)
% Inputs:
% fun2: a function handle, standing for the function written above
% x0: the initial guess of the fixed point
% tol: the tolerance within which the program can stop
% maxIter: the maximum number of iterations the program is allowed to run
% Outputs:
% xStar: the numerical value of the fixed point
% xRoot: the numerical value of the root
x = x0;                                                         % starts our cycle with the input guess
iter = 0;                                                       % sets the first iteration value
while (abs(fun2(x) - x) > tol) && (iter < maxIter)              % checks if we have a close enough approximation or if we have exceeded the max number of iterations
    x = fun2(x);                                                % reassigns our x to a new approximation 
    iter = iter + 1;                                            % adds one to our iteration counter
end
xStar = fun2(x);                                                % reassigns the number of iterations to an output value
xRoot = x;                                                      % reassigns the value of our root to an output value