%{
Filename: hw1_405582562_p4.m

Description: This code models heat transfer and looks at three speicifc
scenarios where either the final temperature, time, or the temperature of 
the thermal chamber are missing. The code returns the value of these 
missing variables for each scenario. 

Name:Mauricio Deguchi
UID: 405-582-562
%}

%% Forefront stuff
clc; clear all; close all; %starts a fresh prompt by removing any previous lines of code or assignments

%% Labeling Known Conditions
k = 0.45; %k remains constant throughout all of the equations

%scenario a known values
t_i_a = 100; %the initial temperature is 100 degrees celcius
t_s_a = 25; %the temperature of the chamber is 25 degrees celcius
t_a = 3; %the total time elapsed in hours 

%scenario b known values
t_i_b = 100; %the inital temperature is 100 degrees celcius
t_s_b = 25; %the temperature of teh chamber is 25 degrees celcius
t_f_b = t_i_b-10; %the temperature drops to a final temperature 10 degrees lower than the initial 

%scenario c known values
t_i_c = 50; %the inital temperature is 50 degrees celcius
t_c = 1.5; %the total elapsed time is 1.5 hours
t_f_c = 40; %the final temperature is 40 degrees celcius

%% Equations
final_temp = (t_s_a)+(t_i_a-t_s_a)*exp(-k*t_a); %this equation is given and solves the scenario depicted in (a)
time_hours = (log((t_f_b-t_s_b)/(t_i_b-t_s_b)))/(-k); %this equation is after some hand-algebraic manipulation of the prior equation and solves part (b)
time_seconds = round(time_hours*3600); %part b seeks the answer in seconds while the previous equation gives the result in hours, this is the conversion factor
ambient_temp = (t_f_c-exp(-k*t_c)*t_i_c)/(1-exp(-k*t_c)); %after some algebraic manipulation, this equation solves for the desired variable in part (c)

%% Printing
fprintf('(a) The final temperature of the object is %8.5f degrees celcius.\n', final_temp); %returns our desired value for the scenario in (a)
fprintf('(b) The total time required for the specified change at such conditions is %4.0f seconds.\n', time_seconds); %returns our desired value for the scenario in (b)
fprintf('(c) The temperature of the thermal chamber is %8.5f degrees celcius.\n', ambient_temp);%returns our desired value for the scenario in (c)
