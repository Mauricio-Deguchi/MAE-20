%{
Filename: hw1_405582562_p1

Description: This code will promt the user to enter their name and a
numerical expression and return their name backwards as well as their
evaluated expression.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront Stuff
clc; clear all; close all; %starts a fresh prompt by removing any previous lines of code or assignments

%% Inputs
yourName = input('Enter your name: ','s'); %asks for the user to input their name
math = input('Enter a mathematical expression: ','s'); %asks the user to input a mathematical expression

%% Manipulations
upper_yourName = upper(yourName); %converts the inputed name into capital letters
number = eval(math); %evlatues the input expression to an integer

%% Result
fprintf('Hello %s, your expression %s evaluates to %.0f.\n', upper_yourName, math, number) %returns the user's name and the integer value of their expression

