%{
Filename: hw2_405582562_p1.m

Description: This code analyzes the characteristics of a cubic function,
determing if it behaves as a simple or monotones function, or neither.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront Stuff
clc; clear all; close all;

%% Taking Inputs & Checking validity
a = input('Enter the coefficient of x^3: ');    % takes first coefficient input
b = input('Enter the coefficient of x^2: ');    % takes second coefficient input
c = input('Enter the coefficient of x: ');      % takes third coefficient input
d = input('Enter the constant term: ');         % takes constant input


% ensures that our coefficient infront of the cubed term is not zero
if (a == 0)
   error('The input for the first coefficient cannot be 0');
% ensures that the user input a value 
elseif isempty(a) || isempty(b) || isempty(c) || isempty(d)
    error('Please enter an input')
end


%% Taking the derivative and reassigning values:
A = 3*a; % new coefficient of the x^2 term after taking the derivative
B = 2*b; % new coefficient of the x term after taking the derivative
%% Checking for monotone or simple
discriminant = B^2-4*A*c; %from the cuadratic formula, this is the discriminant which tells us the behavior of the roots

% checks if the roots do not exist, if they dont then f(x) is monotone
if discriminant <= 0
    fprintf('Monotone\n')
% otherwise, we must calculate the roots and plug them into our original
% f(x)

else
    r1 = (-B + sqrt(B^2-4*A*c))/(2*A);      % quadratic formula (+ square root)
    r2 = (-B - sqrt(B^2-4*A*c))/(2*A);      % quadratic formula (- square root)
    fr1 = a*r1^3 + b*r1^2 + c*r1 +d;        % plug in root 1 to f
    fr2 = a*r2^3 + b*r2^2 + c*r2 +d;        % plug in root 2 to f
    if fr1*fr2 < 0       % if only one of our values is negative, f is simple 
        fprintf('Simple\n')
    else                    % otherwise, f is neither simple nor monotone
        fprintf('Neither\n')
    end
end

  
    
    
    
    
