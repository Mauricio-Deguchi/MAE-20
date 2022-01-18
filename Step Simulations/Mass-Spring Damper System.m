%{
Filename: hw4_405582562_p2.m

Description: This script will simulate a mass-spring system with a
sinusoidal external force being applied to it as well as a frictional
force. This will be done using a semi-implicit euler approximation

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
time_initial = 0;               % start at t = 0
time_final = 80;                % final time is at t = 80
delta_t = .01;                  % time step for euler's method
x_j = 0;                        % start at x = 0
v_j = 0;                        % cart is static at start
c = 0.2;                        % Frictional force constant
t = linspace(0,50,5000);        % set up time axis


%% Establishing Euler's Functions
x = linspace(1,1,5000);           % establish storage array for position value                                                 
for j = 0:4999                    % set boundary for motion
    v_j = v_j + ((f_c*cos(w*j/100) - k * x_j - c * v_j) / m)*delta_t;                   % Establishes euler's semi-implicit formula
    x(j+1) = x_j;                 % establishes previous position as new position
    x_j = x_j + v_j * delta_t;    % calculates next position

end

x_i = 0;                        % start at x = 0
v_i = 0;                        % cart is static at start
x_1 = linspace(1,1,5000);         % establish storage array for position value
h = 1;                            % set new value for w (angular velocity)
for i = 0:4999                    % set boundary for motion
    v_i = v_i + ((f_c*cos(h*i/100) - k * x_i - c * v_i) / m)*delta_t;           % Establishes euler's semi-implicit formula
    x_1(i+1) = x_i;             % establishes previous position as new position
    x_i = x_i + v_i * delta_t;  % calculates next position

end

x_I = 0;                        % start at x = 0
v_I = 0;                        % cart is static at start
x_2 = linspace(1,1,5000);       % establish storage array for position value
l = (k-c)^(1/2);                % set new value for w again (angular velocity)
for I= 0:4999                    % set boundary for motion   
    v_I = v_I + ((f_c*cos(l*I/100) - k * x_I - c * v_I) / m)*delta_t;                   % Establishes euler's semi-implicit formula
    x_2(I+1) = x_I;             % establishes previous position as new position
    x_I = x_I + v_I * delta_t;  % calculates next position

end

%% Plotting
% Constants for Graphs
FONTNAME = 'Arial';
FONTSIZE = 12;
pWidth = 4;
pHeight = 3;

% Figure 1
f1 = figure(1);
scatter(t,x, 'r');

xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Horixontal Amplitude, x [meter]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Mass-Spring System with Sinusoidal External Force');
LEG = legend('w = 3 rad/sec');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f1, 'Fig_problem2_1.pdf');

% Figure 2
f2 = figure(2);
scatter(t,x_1, 'b');

xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Horixontal Amplitude, x [meter]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Mass-Spring System with Sinusoidal External Force');
LEG = legend('w = 1 rad/sec');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f2, 'Fig_problem2_2.pdf');

% Figure 3
f3 = figure(3);
scatter(t,x_2, 'g');
xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Horixontal Amplitude, x [meter]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Mass-Spring System with Sinusoidal External Force');
LEG = legend('w = (k-c)^1^/^2 rad/sec');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f3, 'Fig_problem2_3.pdf');

% Combined
f4 = figure(4);
scatter(t,x_2, 'g');
hold on
scatter(t,x, 'r');
scatter(t,x_1, 'b');
hold off
xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Horixontal Amplitude, x [meter]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Mass-Spring System with Sinusoidal External Force');
LEG = legend( 'w = (k-c)^1^/^2 rad/sec','w = 3 rad/sec', 'w = 1 rad/sec');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f4, 'Fig_problem2_4.pdf');

% almost all of the graphing code was used directly from the lecture slides
% so not many comments were made in this section as it was fairly straight
% forward to implement
