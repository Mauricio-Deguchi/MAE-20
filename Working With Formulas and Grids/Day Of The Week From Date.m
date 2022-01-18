%{
Filename: hw2_405582562_p2.m

Description: This code takes a date as input from the user and return the day of the week on 
said date lands on.

Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Forefront Stuff
clc; clear all; close all;
%% Taking Input
month = input('Please enter the month as MMM (e.g. JAN): ','s');
month = upper(month); % ensures that the program still runs if the user inputs in lowercase
day = input('Please enter the day as DD (e.g. 01): ' );
year = input('Please enter the year as YYYY (e.g. 2000):');

%% Checking Validity of inputs
if ~(strlength(month)==3) % ensures the input month is the right character amount
    error('You entered an invalid month');

elseif (day>31) || (day < 1) || (mod(day,1) ~= 0) % ensures that day input is valid
    error('You entered an invalid day');
    
elseif (year>9999) || (year < 0) || (mod(year,1) ~= 0) % ensures that year input is valid 
    error('You entered an invalid year');
end

%% Checking validity of month & converting month to number
switch month %converts our month input into a correpsonding numerical value for computation later
    case'JAN'
    month_N = 1;
    case'FEB'
    month_N = 2;
    case'MAR'
    month_N = 3;
    case'APR'
    month_N = 4;
    case'MAY'
    month_N = 5;
    case'JUN'
    month_N = 6;
    case'JUL'
    month_N = 7;    
    case'AUG'
    month_N = 8;    
    case'SEP'
    month_N = 9;    
    case'OCT'
    month_N = 10;    
    case'NOV'
    month_N = 11;    
    case'DEC'
    month_N = 12;
    otherwise
    error('You entered an invalid month');
end

%% Checking Validity of Date Input
%Checks for reasonable day input for 30 day months 
if ((month_N == 4) || (month_N == 6) || (month_N == 9) || (month_N == 11)) && (day > 30)
    error('You entered an invalid day'); 

%checks if day is in February on a leap year
elseif (month_N == 2) && day == 29
    if ~(rem(year,4)==0) %checks if year is divisible by 4
        error('You entered an invalid day');
    elseif (rem(year,100)==0) && ~(rem(year,400)==0) %if year is divisible by 4 and 100, then it cant be divisible by 400 for a leap year
        error('You entered an invalid day');
    end
    %checks for valid days in a normal february
elseif (month_N == 2) && day > 28
    error('You entered an invalid day');
end

%% Assigning variables and establishing the algorith
d = day;
m = (mod((month_N + 9), 12)) + 1;   % given as a formula
if (month_N == 1)|| (month_N == 2)  % satisfies the 'Note' condition 
    year_new = year - 1;
end
y = mod(year_new,100);                  % extracts the final 2 digits of the year
c = floor(year_new/100);                % extracts the first 2 digits of the year
w = mod((d + floor(2.6*m - 0.2) + y + floor(y/4) + floor(c/4) - 2*c),7);    %algorithm


%% Interpreting w and printing
switch w   % Converts or calculated output into the corresponding day
    case 0
        w = 'Sunday';
    case 1
        w = 'Monday';
    case 2
        w = 'Tuesday';
    case 3 
        w = 'Wednesday';
    case 4
        w = 'Thursday';
    case 5 
        w = 'Friday';
    case 6 
        w = 'Saturday';
    otherwise
        error('w is invalid');
end
fprintf('%s %02d %04d is a %s\n', month, day, year, w); %prints the final statement
