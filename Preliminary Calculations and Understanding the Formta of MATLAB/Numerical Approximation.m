%{
Filename: hw1_405582562_p2.m

Description: This code analyzes the mass of an object traveling at a
fraction of the speed of light using an exact equation and an
approximation. It then calculates the error in the approximation and
returns the two mass values alongside the error. 

Name:Mauricio Deguchi
UID: 405-582-562
%}

%% Forefront Stuff
clc; clear all; close all; %starts a fresh prompt by removing any previous lines of code or assignments

%% Defining Known Values
m_o = 1; %defines the inital mass given as 1kg
c = 299792458; %defines the speed of light as given by google
v = 0.25*c; %finds the velocity of the object which is known to be moving at a quarter of the speed of light

%% Defining Equations
exact_mass =(m_o)/(sqrt(1-(v/c)^2)); %stores the value of the exact mass as given by the special relativity equation
approx_mass = ((m_o)*(1+0.5*(v/c)^2)); %stores the value of the approximate mass as given by our approximation equation
error = abs(exact_mass-approx_mass)/exact_mass*100; %finds the percentage difference between the two values of mass and stores that as the error

%% Printing
fprintf('The mass of the object using the first, exact, equation is %.6f kg\n', exact_mass); %returns the exact value of the mass
fprintf('The mass of the object using the second, approximate, equation is %.6f kg\n', approx_mass); %returns the approximate value of the mass
fprintf('The error in our approximation is roughly equal to %.3f%%\n', error); %returns the error in our approximation