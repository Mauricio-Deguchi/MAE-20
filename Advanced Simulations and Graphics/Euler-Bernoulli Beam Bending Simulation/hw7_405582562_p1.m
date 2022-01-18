%{
Filename: hw7_405582562_p1.m
Description: This script will simulate an euler-bernoulli beam bending
problem and show the displacement of the beam as a function of distance.
Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront stuff
clc; clear all; close all;

%% Establishing constants
L = 1;
r = 0.08;
P = -1000;
d = 0.6;
E = 65e9;

I = (pi*r^4)/4;         % moment of intertia
EI = E*I;               % constant value which will be used often
nodes = 100;            % number of evenly spaced nodes given in the problem statement
% A * Y = B
tic;
%% Part A) Initialize the A matrix
A = zeros(nodes,nodes);
A(1,1) = 1;                         % we start and end at 1
A(end,end) = 1;

for i = 2:nodes-1                   % using the discretized second order derivative, we find the following pattern:
    A(i,i-1:i+1) = [1 -2 1];
end

% define array of X
X = linspace(0,L,nodes);            % creates our evenly spaces 100 nodes from 0 to L
dx = X(2)-X(1);

%% Part B) Right Hand Side vector
B = zeros(nodes,1);

% creates a loop to calculate all of our right hand sided values, this
% could also have been completed using a function
for j = 2: nodes-1
    x = X(j);
    B(j) = dx^2*M(x,d)/EI;
end
B = -1*B;

%% Calculating Y
Y = A\B;

%% Theoretical calculations
% Define theoretical greatest displacement
c = min([d,L-d]);
if d > L/2
    y_theo = (2*P*(d)^3*(L-(d))^2)/(3*EI*(2*(d)+L)^2);
else
    y_theo = (2*P*(L-d)^3*(L-(L-d))^2)/(3*EI*(2*(L-d)+L)^2);
end
y_theo_abs = abs(y_theo);                       % ensures that our theoretical displacement is in terms of of absolute displacemet
%% Simulation calculations
[y_max,idx] = max(abs(Y));                  % finding the simulation maximum displacement and x position
y_max = abs(y_max);                         % ensures our displacement is in terms of absoluate displacement
error = abs(y_max-y_theo_abs)/abs(y_theo);      % calculating the error in our simulation results

fprintf('The relative error is %f\n', error)
elapsedTime = toc;

%% plotting
f1 = figure(1);
hold on
plot(X,Y, 'o-') % part c


plot(X,y_theo*ones(nodes,1))
hold off

FONTNAME = 'Arial';
FONTSIZE = 11;
pWidth = 4;
pHeight = 3;
xlabel('X position, [m]');
ylabel('Y displacement, [m]');
title('Euler-Bernoulli Beam Bending Displacements')
LEG = legend('Numerical result', 'theory');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);




% a > b

% calculating our theoretical maximum position of displacement
if d > L/2
    x_theo = 2 * d *L /(3*d + L -d);
else
    x_theo = L-2 * (L-d) *L /(3*(L-d) + L -(L-d));
end



% finding the simulation maximum
xsim = X(idx);
fprintf('Theoretical result of xmax is %f; and the simulation result is %f \n', x_theo,xsim);
fprintf('Theoretical result of ymax is %dm; and the simulation result is %dm \n', y_theo_abs,y_max);
display(elapsedTime)