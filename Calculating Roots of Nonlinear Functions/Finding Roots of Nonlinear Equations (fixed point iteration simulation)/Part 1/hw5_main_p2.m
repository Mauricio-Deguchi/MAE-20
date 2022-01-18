%{
Filename: hw5_main_p2.m

Description: This script will use the fixed-point method to solve the root of
a given equation. It will do so by defining the function and then running a
loop to solve for the value where the root is located.

Name:Mauricio Deguchi
UID: 405-582-562
%}

clc; clear all; close all;

[xStar, xRoot] = fixPoint(@fun2, 0, 10e-5, 100);     % prints out our root and xStar for the conditions specified in part ii


fprintf('Approx Root: %f\n', xRoot);
fprintf('xStar: %f\n', xStar);
