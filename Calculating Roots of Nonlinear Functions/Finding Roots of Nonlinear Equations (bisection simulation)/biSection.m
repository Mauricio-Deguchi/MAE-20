function [xRoot, numIter] = biSection(f, a , b, tol)
% Inputs:
% f: a function handle, standing for the function written above
% a: the left boundary of the range
% b the right boundary of the range
% tol: the tolerance within which the program can stop
% Outputs:
% xRoot: the numerical value of the root
% numIter: the number of iterations after which the root is found
% 
% 

e0 = b-a;                                        % e0 is given this specification in our problem statement
nMax = log2(e0 / tol);                           % calculates the maximum number of iterations necessary
k = 1;                                           % starts our iteration cycle
while k <= nMax
    p = (a+b)/2;                                 % takes the average value our our boundary conditions
    if (f(p) == 0) || ((b-a)/2) < tol            % ends the cycle if the root we find its exact position our have a close enough approximation
        break
    end
    k = k + 1;                                   % adds one to our iteration
    if sign(f(p)) == sign(f(a))                  % determines which boundary to halve
        a = p;
    else
        b = p;
    end
end
numIter = k;                                     % reassigns the number of iterations to an output value
xRoot = p;                                       % reassigns the value of our root to an output value