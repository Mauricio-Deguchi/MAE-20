%{
Filename: hw4_405582565_p1.m

Description: This script will simulate a mass-spring system with a
sinusoidal external force being applied to it. It will do so by using the
semi-implicit Euler method.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront stuff
clc; clear all; close all;

%% Establishing Constants
m = 1;                          % mass of the cart is 1kg
k = 10;                         % spring constant is 10 N/m
f_c = 10;                       % Amplitude of the force is 10 N 
w = 3;                          % Angular velocity is 3 m/s
time_initial = 0;               % start at t = 0 sec
time_final = 80;                % final time is at t = 80 sec
delta_t = .01;                 % time step for euler's method
x_i = 0;                       % start at x = 0m
v_i = 0;                       % cart is static at start
t = linspace(0,80,8000);
x = linspace(1,1,8000);
x_1 = linspace(1,1,8000);
%% Establishing Euler's Functions

for i = 0:7999                  % Establishes the loop start and end values
    v_i = v_i + ((f_c*cos(w*i/100) - k * x_i) / m)*delta_t;     % establishes Euler's semi-implicit formula
    x(i+1) = x_i;                 % establishes previous position as new position                       
    x_i = x_i + v_i * delta_t;    % calculates next position

end

% this next for loop runs identically to the one earlier, simply with a new
% value of w (angular velocity) to experiment what our graph will look like
w = 10^(1/2);
for i = 0:7999
    v_i = v_i + ((f_c*cos(w*i/100) - k * x_i) / m)*delta_t;
    x_1(i+1) = x_i;
    x_i = x_i + v_i * delta_t;

end


h1 = figure(1);                   % Dedicates figure 1 window for our plot
scatter(t,x_1,'b')                  % plots our first trial with w = 3
hold on                           % Ensures our second plot can be added on top of our current plot
scatter(t,x, 'r')     % plots our second set of data with some transparency to ensure we can still see our previous plot
hold off
FONTNAME = 'Arial';
FONTSIZE = 12;

% plotting axes, legends, etc.
pWidth = 4;
pHeight = 3;
xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Horixontal Amplitude, x [meter]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Mass-Spring System with Sinusoidal External Force');
LEG = legend('w = 10^1^/^2 rad/sec', 'w = 3 rad/sec');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(h1, 'Fig_problem1c.pdf');


% almost all of the graphing code was used directly from the lecture slides
% so not many comments were made in this section as it was fairly straight
% forward to implement