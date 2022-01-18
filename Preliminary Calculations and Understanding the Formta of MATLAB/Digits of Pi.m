%{
Filename: hw1_405582562_p3.m

Description: This code asks the user for a number of decimal places to
round pi to and returns pi to the specified number of decimal places.

Name:Mauricio Deguchi
UID: 405-582-562
%}

%% Forefront stuff
clc; clear all; close all; %starts a fresh prompt by removing any previous lines of code or assignments

%% defining pi

pi = pi;

%the above line stores pi to many digits


%% User Inputs
digits = round(input('Number of digits to print: ')); %obtains the input for the number of desired digits of pi 
%and accounts for a scenario where the user may input a decimal as their desired number of digits by rounding the input  

%% Printing
fprintf('Pi to %1.0f digits is %.*f\n', digits, digits,  pi); %returns pi with the desired number of digits



