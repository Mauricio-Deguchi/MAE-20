function write2Excel(mesh, t, X, filename)
% % write2Excel: a function that stores the vertices' locations, the ...
% ratios of infected, susceptible and recovered in an Excel file
%   Inputs:
%       mesh: an struct of mesh information of the triangulated surface
%       t: a vector of time steps
%       X: an N*3*length(t) matrix, where each Nx3 matrix corresponds to
%       the state of the S.I.R. system at a particular instance in time.
%       This 2D matrix is repeated for each time step, making it a 3D ...
%       matrix.
%       filename: the name of Excel file used to store data
%   Output: this function does not output anything.

% write a script that will print the S, I, R values to an excel file. The
% name of the sheet should indicate the time.


N = numel(t);               % number of steps
Nc = size(X,1);             % number of locations
S = zeros(Nc,1);            % susceptible rate
R = zeros(Nc,1);            % recovered rate
I = zeros(Nc,1);            % Infected rate
struct_table = struct2table(mesh);      % turns our mesh structure into a table
struct_table(:,2) = [];                 % gets rid of the neighbor data from our table
points = table2array(struct_table);     % turns our table of coordinates into an array of points
x = points(:,1);            % this will give a vertical array of all the x-points
y = points(:,2);            % this will give a vertical array of all the y-points
z = points(:,3);            % this will give a vertical array of all the z-points

% established the variable names for our final excel sheet
variableNames = {'X-Coordinate','Y-Coordinate','Z-Coordinate','Susceptible Rate', 'Infected Rate', 'Recovered Rate'};
time_sheet = 0;         % variable to control the time gap between sheets 
for j = 1:N                                 % we will check all of the time points       
    if (t(j) >= time_sheet)    % if we have a time greater than the time gap or we are at the end, we need to store the following information
        S(:) = X(:,1,j);                    % susceptible rate at i'th step
        I(:) = X(:,2,j);                    % Infected rate at i'th step
        R(:) = X(:,3,j);                    % Recovered rate at i'th step
        T = table(x, y, z, S,I,R,'VariableNames', variableNames);               % we will create a table of our coordinates and SIR data
        nameOfSheet = sprintf('T = %f',t(j));                                   % this will establis the name of the sheet with the corresponding time
        writetable(T,filename, 'Sheet', nameOfSheet,'Range','A1');              % this will create out sheet at the given time step
        time_sheet = t(j) + 15;                                                 % our next sheet needs to be at least 15 seconds away from the current one
    end
end

end





