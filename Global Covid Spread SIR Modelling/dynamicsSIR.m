function dxdt = dynamicsSIR(x, mesh, alpha, beta, gamma)
% dynamicsSIR Compute the rate of change of the model
%   Inputs:
%       x: vectorized state
%       mesh: the underlying mesh
%       alpha, beta, gamma: model parameters
%   Output:
%       dxdt: vectorized time derivative of state

N = length(mesh);           % finds the length of the mesh (number of unique points)
x = reshape(x, [N,3]);      % reshapes vector x into N rows of [S, I, R]


derivatives = zeros(N,3);   % establishes the derivatives matrix to store our differential equation values
% [dS1/dt, dI1/dt, dR1/dt;
%  dS2/dt, dI2/dt, dR2/dt;
%  dS3/dt, dI3/dt, dR3/dt;
% ...
%  dSN/dt, dIN/dt, dRN/dt];
for i = 1:N                 % for each point, we will have 3 derivative, (Susceptibles, Infected, and Recovered)
    neighborContribution = 0;                   % we will begin implementing the differential equations on page 5 by initializing the neighbor contribution
    num_neighbors = length(mesh(i).neighbors);  % the neighbor contribution depends on the number of neighbors the point has   
    for j = 1:num_neighbors                     % each neighbor will contribute, so we will loop through each neighbor to find the total contribution to a point
        neighbor = mesh(i).neighbors(j);        % finds the index of one of the neighbors
        dist = norm(mesh(i).location-mesh(neighbor).location);                  % finds the Euclidian distance between that point and the neighbor
        neighborContribution = neighborContribution + (x(neighbor,2)/dist);     % the neighbor contribution is a sum of all the infected to distance ratios for each neighbor to a single point
    end
    derivatives(i,1) = -(beta *x(i,2) + (alpha/num_neighbors)*neighborContribution) * x(i,1);     % We can then solve for S_i using equation 5

    derivatives(i,2) = (beta *x(i,2) + (alpha/num_neighbors)*neighborContribution) * x(i,1) - gamma*x(i,2);       % We can solve for I_i using equation 6

    derivatives(i,3) = gamma*x(i,2);    % We can solve for R_i using equation 7

end
% Vectorize the derivatives: [S1 S2 S3 ...SN I1 I2 I3 ... IN R1 R2 R3 ...RN]
dxdt = derivatives(:);
end