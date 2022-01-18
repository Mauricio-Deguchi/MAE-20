%{
Filename: hw6_main_p2.m
Description: This script will create a customized probability density
function in accordance to the equation provided in the problem statement
Name:Mauricio Deguchi
UID: 405-582-562
%}

%% Forefront stuff 
clc; clear all; close all;               
n = 11000;                         % Number of samples 
x = myRand(n);                     % Generates the random numbers from our customized probability density

%% Plotting
f1 = figure(1);
histogram (x, 30, 'Normalization', 'pdf');
hold on
delta = 3/n;
x1 = 0:delta:3;
y = (-2/9)*x1+2/3;
plot(x1,y);
hold off
FONTNAME = 'Arial';
FONTSIZE = 12;
pWidth = 4;
pHeight = 3;
legend('Prob. from myRand', 'Eq 1.1')
xlabel('x values', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
ylabel('Probability', 'Fontname', FONTNAME, 'Fontsize', FONTSIZE );
title('Customized Probability Density Function for Equation 1.1');
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [ 0 0 pWidth pHeight],... 
    'PaperSize', [pWidth pHeight]);
saveas(f1, 'Fig_hw6_p2.pdf');

