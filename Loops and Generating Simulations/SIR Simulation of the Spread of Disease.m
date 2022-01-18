%{
Filename: hw3_405582562_p3.m

Description: 

Name:Mauricio Deguchi
UID: 405-582-562
%}

%% Forefront stuff
clc; clear all; close all;

%% Establishing constants
B = 0.0026;         % beta is given
Y = 0.5;            % gamma is give
deltaT = 0.1;       % this is our time increment

%% Establishing initial conditions
i_k_1 = 1;          % _1 notation is used for later when we want to know 3 consecutive values of the infected population
s_k = 700;          % establishes initial susceptible population
r_k = 0;            % no one has recovered when we first begin

%% Establishing variables for the loop functions
% any value is assigned here, we simply want to establish the variable and
% reassign their value later in the for loop to their true values
s_k_1 = 0;

i_k_2 = 0; 
% for i_k we have three values which will help us determine 
...where the maximum lies later on in the problem 
i_k =0;

r_k_1 = 0;


%% Establishing functions
for t = 0:0.1:20 % establishes our initial and final time along w the time step

% euler's equation for the susceptible population
    s_k_1 = s_k - deltaT * B * s_k * i_k_1;     

% euler's equation for the infected population
    i_k_2 = i_k_1 + deltaT *(B * s_k * i_k_1 - Y * i_k_1);

% euler's equation for the recovered population
    r_k_1 = r_k + deltaT * Y * i_k_1;

% stores the new susceptibles as old susceptibles for next cycle
    s_k = s_k_1;

    if (i_k < i_k_1) && (i_k_1 > i_k_2) % checks to see if we hit a max by comparing the previous two values and the current value.
        fprintf('The maximum number of infected students is %d at t = %.1d\n', floor(i_k_1), t);
    end
% stores the previous infected as 2x previous infected for next cycle
i_k = i_k_1;

% stores current infected as previous infected for next cycle
i_k_1 = i_k_2;

% stores current recovered as previous recover for next cycle
r_k = r_k_1;

% plots all the points as t grows on the same graph

hold on
% creates a scatter plot of our infected people as a function of time
h1 = figure(1);
scatter(t,i_k, 'red');
scatter(t,r_k, 'green'); %these two lines were completely extra but I thought
scatter(t,s_k, 'blue');  %it was intersting to see all three plots together
hold off
end 

%% Label Scatter plot & setting appropriate figure name


FONTNAME = 'Arial';
FONTSIZE = 11;
pWidth = 4;
pHeight = 3;
xlabel('Time, t [second]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Number of Infected Students, i_k, [students]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE);
title('Scatter Plot of Infected Students vs Time between t = 0 and t = 20');


set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(h1, 'Fig_hw3_p3.png');
