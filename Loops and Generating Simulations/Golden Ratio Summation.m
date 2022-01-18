%{
Filename: hw3_405582562_p1.m

Description: This script takes in a user input error and uses two forms of
approximating the golden ratio to such such error. The first approximation
uses cosine which can be approximated using a sumation. The second uses the
fibonacci sequence to approximate the ratio between two consecutive
numbers.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront stuff
clc; clear all; close all;
error = input('Input desired error: ');
decimals = abs(log10(error))+5;

%% Cosine approximation
x = 0;              % start with x = 0 for our first iteration
err = 1;            % arbitrary start value for error in order to enter the while loop
n_1 = 0;            % iteration counter start from 0
rad = 36*pi/180; % obtains the angle 36 degrees in radians
while abs(err) >= error
    cosine = x + ((-1)^n_1*(rad^(2*n_1)/(factorial(2*n_1))));       % depicts the summation provided in the problem statement
    n_1 = n_1 + 1;                                                  % increases counter by 1
    err = 2* (cosine-x);                                            % checks the value of the error of x
    x = cosine;                                                     % reassigns x for next iteration or print
end
golden_ratio = 2*cosine;                                            % establishes the final value of the golden ratio


%% Fibonacci Sequence approximation
first = 0;                                      % fibonacci sequence depends on two consecutive numbers, this is the first of the two
second = 1;                                     % this is the second consecutive number from the fibonacci sequence
n_2 = 0;                                        % starts iteration counter from 0
while (abs(golden_ratio - second/first) >= error)       % compares the abosulte error in our fibonacci approximation to our previous estimation from the cosine loop
    third = second + first;                             % takes the sum of the two consecutive values to find the next value in the fibonacci sequece
    first = second;                                     % reassigns our old first term to the old second term
    second = third;                                     % reassigns our old second term to our new consecutive term
    n_2 = n_2+1;                                        % increases iteration counter by 1

end
golden_r_2 = second/first;                              % finds our final approximation for the golden ratio through the fibonacci sequence

fprintf('It took the first approximation %.0f iterations while it took the second approximation %.0f \niterations to achieve the simlar results of %.*f and %.*f respectively.\n',n_1 ,n_2, decimals ,golden_ratio, decimals, golden_r_2);

