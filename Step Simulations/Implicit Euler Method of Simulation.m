%{
Filename: hw4_405582562_p3.m

Description: This script will simulate two spring-mass systems each with a
sinusoidal external force acting on it but one with a frictional force also
acting on it. This will be done using the implicit euler method.

Name:Mauricio Deguchi
UID: 405-582-562
%}

%% Forefront stuff 
clc; clear all; close all;

%% Setting up the constants

m = 1;                          % mass of the cart is 1kg
k = 10;                         % spring constant is 10 N/m
f_c = 10;                       % Amplitude of the force is 10 N 
w = 3;                          % Angular velocity is 3 m/s
time_initial = 0;               % start at t = 0
time_final = 80;                % final time is at t = 80
delta_t = .01;                  % time step for euler's method
x_k = 0;                        % start at x = 0
v_k = 0;                        % cart is static at start
c = 0.2;                        % Frictional force constant
q = zeros(2, 5000);
t = linspace(0,50,5000);
%% Setting up Netwon's Method

for i = 1:4999                          % establishes loop amount
    err = 1;                            % Ensures we enter the while loop to begin cycle
    while err > 1e-6
    v_i = q(2,i);                       % establishes initial velocity
    v_i1 = q(2,i+1);                    % establishes next velocity
    x_i = q(1,i);                       % establishes initial position
    x_i1 = q(1,i+1);                    % establishes next position
        
    % Establishes f function with the two discretized functions
    fx = [ m*(v_i1-v_i)/delta_t + c * v_i1 + k * x_i1- f_c*cos(w*t(i+1)); ...
    v_i1 - (x_i1 - x_i)/delta_t];
    % establishes the jacobian, calculated by hand taking the respective
    % partial derivatives
    Jx = [k, m/delta_t + c,; -1/delta_t, 1 ];
    deltaX = Jx\fx;                     % calculates the change in our values from this occurence to the next
    q(:,i+1) = q(:,i+1) - deltaX;       % adjusts our stored valus according to the previous calculation
    err = (fx(1)^2+fx(2)^2)^(1/2);      % checks for error in our values to ensure we can move on to the next value in time
    end
end

%% Plotting
f1 = figure(1);
scatter(t, q(1,:),'b')
FONTNAME = 'Arial';
FONTSIZE = 12;
pWidth = 4;
pHeight = 3;
xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Horixontal Amplitude, x [meter]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Mass-Spring System with Sinusoidal External Force');
LEG = legend('w = 3 rad/sec');
set(LEG, 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);

set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f1, 'Fig_problem3_1.pdf');


% almost all of the graphing code was used directly from the lecture slides
% so not many comments were made in this section as it was fairly straight
% forward to implement