function [t,x] = solveSpatialSIR (tFinal, mesh, initialCondition, alpha, beta, gamma, odeSolver)
% solveSpatialSIR Solve the spatial SIR model
%   Inputs:
%       tFinal: end time for the simulation (assuming start is t=0)
%       mesh: the underlying mesh
%       initialCondition: a Nx3 matrix that sums to 1 in third dimension
%       alpha, beta, gamma: model parameters
%       odeSolver: a function handle for an ode45-compatible solver
%   Outputs:
%       t: a vector of the time-steps
%       x: Nx3xlength(t) matrix representing the state vs. time

% establishes the function dSIRdt as a function of x and t
dSIRdt = @(t,x) dynamicsSIR(x, mesh, alpha, beta, gamma);

% calls the ode solver and inputs the dSIRdt function to obtain all the SIR
% values and the time array
[t,y] = odeSolver(dSIRdt, [0, tFinal], initialCondition(:));


N = length(mesh);       % finds the total number of unique points
Nsteps = length(t);     % finds the length of the time array
x = zeros(N,3,Nsteps);  % preallocates the final array which will include all the points, time and state

for i = 1:Nsteps                % loops through all time steps
    local_sol = y(i,:);         % S, I, R values at i-th step
    reshape_sol = reshape(local_sol, [N,3]); % Nx3 Matrix
    x(:,:,i) = reshape_sol;     % stores the points and state for each time step
end

end