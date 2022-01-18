%{
Filename: project_405582562_p1.m
Description: This is the main script for problem 1. It will bring together
the data from the covid_countries.csv file into a plot alongside the myPCA
function to interpret the data. The goal of this problem is to reduce the
dimmensionality of the data provided into the most influential factors. 
Name:Mauricio Deguchi
UID: 405-582-562
%}

%% forefront stuff
clc; clear all; close all;
%% Collecting and transforming data

data = readtable('covid_countries.csv', 'VariableNamingRule', 'preserve');  % imports the covid_countries csv file to matlab
dataDuct = table2array(data(:,3:end));              % eliminates all of the varible names and country names
fprintf('Calling myPCA ... \n');                    % notifies the user that we are using the myPCA function
ticStart = tic;                                     % starts timer to run myPCA function
[coeff0rth, pcaData] = myPCA(dataDuct);             % runs myPCA function
fprintf('Done in %.3f seconds\n',toc(ticStart))     % returns run time to user

%% Creating the figure
vbls = data.Properties.VariableNames;               % stores the name of the variables provided in the original file
vbls = vbls(3:end);                                 % gets rid of country name and date as variables
pcaData2D = pcaData(:,1:2);                         % extracts the information from the 2 largest contributing eigen values
E2D = coeff0rth(:,1:2);                             % extracts the first two eigen vectors
biplot(E2D, 'Scores', pcaData2D,'VarLabels',vbls)   % projects the normalized data onto the vector space of the largest contributing eigenvectors