function plotTimeSeries(mesh,t,X,coord)
% plotTimeSeries: a function that plots and saves the local S.I.R ...
% distribution at spatial coordinate (x, y, z).
%   Inputs:
%       mesh: an struct of mesh information of the triangulated surface
%       t: a vector of time steps
%       X: an N*3*length(t) matrix, where each point in the M*3 space
%       corresponds to a local S.I.R. model with states whose values ...
%       are between 0 and 1. This 2D matrix is repeated for each time step, ...
%       making it a 3D matrix.
%       coord: a 1*3 vector of local vertex's coordinate
%   Outputs:
%       This function has no outputs
N = length(mesh);                           % number of nodes
points_array = zeros(N,3);                  % coordinates of nodes
for i = 1:N                                 % looping over each node
    points_array(i,:) = mesh(i).location;   % saves our location structure as an array 
end

FONTNAME = 'Arial';     % font for x and y labels
FONTSIZE = 7;          % font size for x and y labels


idx = find(ismember(points_array, coord, "rows"));      % finds the index position of the input coordinate
susceptibles = X(idx,1,:);  % stores the susceptibles proportion array for the given point
infected = X(idx,2,:);      % stores the infected proportion array  for the given point
recovered = X(idx,3,:);     % stores the recovered proportion array for the given point
coord1 = coord(1);      % stores the value of the x-coordinate
coord2 = coord(2);      % stores the value of the y-coordinate
coord3 = coord(3);      % stores the value of the z-coordinate
f1 = figure;                 % opens a new figure window
subplot(3,1,1);         % begins subplot with the top plot
plot(t,susceptibles(:),'b');    % plots susceptibles versus time
title(sprintf('Local SIR Distribution at spatial coordinate (%.2f, %.2f, %.2f)', coord1, coord2, coord3) ...
    , 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);
ylabel('Susceptible ratio', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );   % y label for middle plot
xlabel('time', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );             % x label top plot
subplot(3,1,2);             % begins middle plot
plot(t,infected(:),'r');    % plots infected versus time
ylabel('Infected ratio', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );   % y label for middle plot
xlabel('time', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );             % x label middle plot
subplot(3,1,3);             % begins bottom plot 
plot(t,recovered(:),'g');   % plots recovered versus time
ylabel('Recovered ratio', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );  % y label for bottom plot
xlabel('time', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );             % x label for bottom plot

%% Saving plot
pWidth = 4;         % sets width of figure
pHeight = 3;        % sets height of figure
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f1, sprintf('time_series_%.2f_%.2f_%.2f.png', coord1, coord2, coord3));      % saves figure as pdf
end
