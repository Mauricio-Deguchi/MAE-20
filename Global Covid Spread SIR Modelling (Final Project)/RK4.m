function [t, y] = RK4(f, tspan, y0)
% RK4 Bogacki-Shampine method of RK4 with adaptive step size
%   Inputs:
%       f: function handle of f(t, y)
%       tspan: the time period for simulation (should be a 1x2 array ...
%       contain start time and end time)
%       y0: the initial conditions for the differential equation
%   Outputs:
%       t: corresponding time sequence as a T x 1 vector
%       y: the solution of the differential equation as a T x n matrix, ...
%       where T is the number of time steps and n is the dimension of y

y0 = y0(:);         % ensures our initial condition will be a column vector
h = 0.1;            % set the step size
e0 = 1e-4;          % given constant in pseudocode
t = zeros(1,1000);  % preallocates the memory for the time
t(1) = tspan(1);    % records our starting time
y(:,1) = y0;        % set the intial value for y
i = 1;              % initializes our index varibale
while t(i) < tspan(2)           % while we are below the upper time limit
    h = min([h,tspan(2)-t(i)]);   % we will implement the pseudocode in the problem statement, this line will determine our time step
    t(i+1) = t(i) + h;          % we will increase our time and store it by the time step
    k1 = f(t(i),y(:,i));        % slope at the beginning of the interval 
    k2 = f(t(i)+1/2*h,y(:,i)+1/2*k1*h);     % slope at the midpoint using y and k1
    k3 = f(t(i)+3/4*h,y(:,i)+3/4*k2*h);     % slope at midpoint using y and k2
    y(:,i + 1) = y(:,i) + 2/9*h*k1 + 1/3*h*k2 + 4/9*h*k3;       % determines the next set of y values
    k4 = f(t(i)+h,y(:,i+1));                                    % slope at the endpoint
    z = y(:,i) + 7/24*h*k1 + 1/4*h*k2 + 1/3*h*k3 + 1/8*h*k4;    % finds the second order approximation of the exact solution 
    ek = norm(y(:,i+1)-z);                                      % normalizes the difference between the second order and the third order approximation
    h = h*(e0/ek)^(0.2);                                        % evolving value which will help determine our step size
    i = i + 1;                                                  % counter goes up by 1
end
t = t(1:i);
y = y.';        % takes the transpose of our data to output in the same manner as that out ode45
t = t.';        % ^
end


