%{
Filename: hw5_main_p3.m

Description: This script will use the fixed-point method to solve the root of
a given equation. It will attempt to approximate the root of another
function using the same method as problem 2

Name:Mauricio Deguchi
UID: 405-582-562
%}

clc; clear all; close all;


[xStar3, xRoot3] = fixPoint(@fun3, 3, 10e-5, 100);     % prints out our root and xStar for the conditions specified in part iii

[xStar0, xRoot0] = fixPoint(@fun3, 0, 10e-5, 100);     % prints out our root and xStar for the conditions specified in part iii with a new guess value


fprintf('Approx Root for initial guess 3: %f\n', xRoot3);
fprintf('xStar for initial guess 3: %f\n', xStar3);
fprintf('Approx Root for initial guess 0: %f\n', xRoot0);
fprintf('xStar for initial guess 0: %f\n', xStar0);