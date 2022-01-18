%{
Filename: project_405582562_p2.m
Description: This is the main script for problem 2. It will incorporate all
of the remaining functions (STLRead, solveSpatialSIR, plotTimeSeries, animate & 
write2Excel) to calculate the SIR over time, generate various plots, an animation 
of the dynamic SIR, and output a sheet of the corresponding data.
Name:Mauricio Deguchi
UID: 405-582-562
%}


%% forefront stuff
clc; clear all; close all;


%% Loading mesh
fprintf('Calling STLRead ... \n');      % notifies the user that we are going to use STLRead
ticStart = tic;                         % starts timer
mesh = stlRead('modifiedSphereSTL.txt');            % calls STLRead
fprintf('Done in %.3f seconds\n',toc(ticStart))     % returns run time to user

%% Loading SIR Parameters
load('SIRparameters.mat')       % imports the SIR parameters
N = length(mesh);               % finds the total number of unique coordinates
initialConditions = zeros(N,3); % initializes an array of zeros to represent the SIR at each coordinate 
initialConditions(:,1) = 1;     % S's
initialConditions(:,2) = 0;     % I's
initialConditions(:,3) = 0;     % R's
num_infect = numel(initialInfections);  % finds the number of initial infections

for i = 1:num_infect    % loop over each infected place
    for j = 1:N         % loop over each node
        dist = norm(mesh(j).location - initialInfections{i});       % finds the distance between the initial infection node and the given coordinate we are analyzing
        if dist < 1e-10     % the distance between them is extremely small, we can conclude that the point we are inspecting is the one we were searching for
            ind = j;        % infection has happened, so lets store this variable
            break
        end
    end
    initialConditions(ind,:) = [0 1 0];     % S = 0; I = 1; R = 0, we will reassign the index with the initial infection to have initial infection
end

%% Solving the spatial SIR 
% calling it with ODE45
fprintf("Calling solveSpatialSIR with ode45 ...\n");      % notifies the user that we are going to use ode45 for the solveSpatialSIR
ticStart = tic;                                           % starts timer
[tx_ode45,x_ode45] = solveSpatialSIR(tFinal, mesh, initialConditions, alpha, beta, gamma, @ode45);   % calls the solveSpatialSIR funtion with ode45
fprintf('Done in %.3f seconds\n',toc(ticStart));          % returns run time to user

% calling it with RK4
fprintf("Calling solveSpatialSIR with RK4 ...\n");        % notifies the user that we are going to use RK4 for the solveSpatialSIR
ticStart = tic;                                           % starts timer
[tx_RK4,x_RK4] = solveSpatialSIR(tFinal, mesh, initialConditions, alpha, beta, gamma, @RK4);         % calls the solveSpatialSIR funtion with RK4
fprintf('Done in %.3f seconds\n',toc(ticStart));          % returns run time to user

%% Calling plotTimeSeries
fprintf('Calling plotTimeSeries at the specified coordinates ... \n');      % notifies the user that we are going to use plotTimeSeries
ticStart = tic;                         % starts timer
for i = 1:numel(monitorLocations)       % we want to call plotTimeSeries for each of the monitor locations
    plotTimeSeries(mesh,tx_RK4,x_RK4,monitorLocations{i});      % calls plotTimeSeries
end
fprintf('Done in %.3f seconds\n',toc(ticStart))                 % returns run time to user


%% Calling Animation
fprintf('Calling animate to generate the animation ... \n');      % notifies the user that we are going to use animate
ticStart = tic;                                         % starts timer
animate(mesh,tx_RK4,x_RK4);                             % calls the animate function
fprintf('Done in %.3f seconds\n',toc(ticStart));        % returns run time to user

%% Calling write2Excel
fprintf('Calling write2Excel to export data ... \n');      % notifies the user that we are going to use write2Excel
ticStart = tic;                                      % starts timer
write2Excel(mesh,tx_RK4,x_RK4,'SIRData.xlsx');       % calls write2Excel
fprintf("Done in %.3f seconds\n",toc(ticStart));     % returns run time to user






