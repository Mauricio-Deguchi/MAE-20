%{
Filename: hw6_main_p3.m
Description: This script will run a Monte Carlo simulation to determine the
probability of at least one pair of matching birthdays in a group. We will
run this simulation for a large amount of trials for groups of size 2 to
50, if need be we can extend the upper limit in order to determine what
group size we need for at least a 50-50 chance of having a single matching
birthday.
Name:Mauricio Deguchi
UID: 405-582-562
%}


%% Forefront stuff
clc; clear all; close all;

%% Generating data

N = 50;                                         % max number of people in room
match = zeros(N,1);                             % creating storage for if people get matched
A = 300000;                                       % large number of trials
total = zeros(N,1);                             % total number of matches per group for numerous trials
for j = 1:A                                     % starts loop for various trials of our simulation
    for n = 2:N                                 % starts loop for groups of different sizes w the largest group N
        day = ceil(365*rand(n,1));              % takes a random sample from 0-365
        day = sort(day);                        % sorts the values from the array to make it easier to search for matches
        shared = 0;                             % initializes our counting variable
        for i = 1:n-1                           % starts loop which will check for two values to match which are back to back after being sorted
            if (day(i) == day(i+1)) && (shared == 0)                
                shared = shared + 1;            % adds one to our counter if we have a match
            end
        end
        match(n) = shared;                      % stores the amount of matches for the group we just computed
    end 
    total = total + match;                      % stores the total number of matches for each group over various trials
end


%% Preparing to plot
prob = total/A;                                 % divides the total matches by our number of trials to get the probability
groupSizes = linspace(1,N,N);

%% plotting
f1 = figure(1);
scatter(groupSizes,prob);
FONTNAME = 'Arial';
FONTSIZE = 12;
pWidth = 4;
pHeight = 3;
xlabel('Group Size, N [people]', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Probability of Having at Least One Match', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1])
xticks([0 5 10 15 20 23 25 30 35 40 45 50])
title('Birthday Paradox Probability Curve for Various Group Sizes');
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f1, 'Fig_hw6_p3.pdf');




