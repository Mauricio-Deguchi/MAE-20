function result = M(x,d)
% Inputs:
% x: the distance we want to analyze from the lend boundary condition
% d: the distance at which the load is applied from the left boundary
% 
% Outputs:
% result: the numerical value of the moment at the input value x


P = 1000;                   % our given load is 1000 
L = 1;                      % total length of our bar = 1m

% various calculated constants used in the later equation
M0 = P*d*(L-d)^2/L^2;       
M1 = -2*P*d^2*(L-d)^2/L^3;
M2 = P*d^2*(L-d)/L^2;

% we will have a differnet moment depending on which side of the the load
% we want to analyze
if x <= d
    result = M0 + (M1-M0)*x/d;
else
    result = M1 +(M2-M1)*(x-d)/(L-d);
end
end