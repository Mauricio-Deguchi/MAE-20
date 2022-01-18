%{
Filename: hw3_405582562_p2.m

Description: This script computes the permutaion of two user input values
without using the factorial function.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront stuff
clc; clear all; close all; % removes any prior input


%% Taking input & Checking Validity
n = input('Enter a value for n: '); 
while(mod(n,1) ~= 0) || (n < 0)     % ensures that the input values are whole numbers
    n = input('Enter a value for n: '); 
end

r = input('Enter a value for r: ');
while (mod(r,1) ~= 0) || (r < 0)    % ensures that the input values are positive 
    r = input('Enter a value for r: ');
end


%% Factorial function
x_new = 1;          % initial value for any factorial
x = 0;              % ensures that we will go into the for loop
if (n - r) < 0      % accounts for situations when n > r and the for loop prints '-0' due to the way I structured the factorial
    fprintf('%.0f\n', x);
else
for x= (n - r + 1):n    % sets lower and upper bound for our permutation function
    x_new = x_new*x;    % multiplies each increasing value 
end
fprintf('%.0f\n',x_new) % prints final value after factorials
end






