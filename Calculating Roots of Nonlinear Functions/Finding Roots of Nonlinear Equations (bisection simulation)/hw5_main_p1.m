%{
Filename: hw5_main_p1.m

Description: This script will use the bisection method to solve the root of
a given equation. It will do so by defining the function and then running a
loop to solve for the value where the root is located.

Name:Mauricio Deguchi
UID: 405-582-562
%}


%% Forefront Stuff
clc; clear all; close all;

[xRoot, numIter] = biSection(@fun1, 0, 1, 10e-5);    % Prints out the value of our root and the number of iterations it took to find this approximation

true_root = fzero(@fun1, 0);                         % finds the true value of our root and serves as comparison to our algorithm 

fprintf('Approx Root: %f\n', xRoot);
fprintf('True Root: %f\n', true_root);
fprintf('Number of iterations: %f\n', numIter);