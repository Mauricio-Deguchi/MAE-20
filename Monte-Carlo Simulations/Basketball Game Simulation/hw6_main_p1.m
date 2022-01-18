%{
Filename: hw6_main_p1.m
Description: This script will simulate two strategies in the final moments
of a basketball game to determine which strategy has a higher success rate.
It will do so using the Monte Carlo simulation method.
Name:Mauricio Deguchi
UID: 405-582-562
%}
%% Possession values:
% 0 = their possession
% 1 = our possession
% 2 = their rebound attempt
% 3 = our rebound attempt

%% Forefront stuff

clc; clear all; close all;

%% Dynamic probabilities & Trials

my2 = 0.4;                          % our 2 point shot probability
offRebR = 0.25;                     % offensive rebound after normal shot
offRebF = 0.15;                     % offensive rebound after freethrow
theirFree = 0.8;                    % probability of them making a freethrow
my3 = 0.35;                         % our 3 point shot probability

% Switch the commented section depending on which scenario you want to
% simulate

% my2 = 0.60;                       % our 2 point shot probability
% offRebR = 0.25;                   % offensive rebound after normal shot
% offRebF = 0.15;                   % offensive rebound after freethrow
% theirFree = 0.65;                 % probability of them making a freethrow
% my3 = 0.25;                       % our 3 point shot probability

N = 300;                       % number of trials

%% Establishing Constants
overProb = 0.5;                     % Overtime chance of winning
win1 = 0;                           % starts win counter at 0 for 2 point shot strategy
%% We Take the two
for n = 1:N                         % starts loop for the various trials of the end of the game
    ourScore = 0;                   % resetting our initial conditions at the beginning of each trial
    theirScore = 3;
    time = 30;
    possession = 1;
    over = 0;
    while time > 0                                                                          % starts time loop
        if ((theirScore - ourScore) >= 3) && (time > 0) && (possession == 1)                % checks for a 2 point shot where we are down by 3 or more points
                [ourScore, time, possession] = our2pointer(ourScore,time, my2);             % simulates our 2 point shot
                if (possession == 3)                                                        % checks if we missed the shot
                    [possession] = ourOffensiveRebound(offRebR);                            % simulates the rebound for possession to be ours or theris
                end
        end
        if (possession == 0) && (time > 5)                                                  % checks for a foul situation 
            [theirScore, possession, time] = theirPossesion(theirScore, time,theirFree);    % simulates the foul and free throws
            if (possession == 2)                                                            % checks if they missed the second freethrow
                [possession] = theirOffensiveReboundFree(offRebF);                          % simulates the rebound scenario
            end
        end
        if (possession == 0) && (time == 5)                                                 % if they have possession with 5 seconds remaining, there is no time to foul so they run down the clock
            time = 0;
        end
        if ((theirScore - ourScore) < 3) && (time > 0) && (possession == 1)                 % if we have possession and are down by 2 or 1 point, we go for a 2 point buzzer
            [ourScore] = our2pointer(ourScore,time, my2);                                   % simulates the 2 point buzzer beater
            time = 0;                                                                       % we went for a buzzer beater so we ran down the clock
        end
    end
    if time == 0                            % ensures that time is 0 and we didnt break our code
        if ourScore > theirScore            % if we have more points, we win
        win1 = win1 + 1;                    % adds one to our win counter
        end
        if ourScore == theirScore           % if we are tied, we go to overtime
            [over] = overtime(overProb);    % simulates overtime
            win1 = win1 + over;             % over = 1 if we won overtime and over = 0 if we lost overtime
        end
    end
end

      
%% We take the three 
win2 = 0;                                           % starts win counter at 0 for 3 point shot strategy
for n = 1:N                                         % starts loop for the various trials of the end of the game
    ourScore = 0;                                   % resetting our initial conditions at the beginning of each trial
    theirScore = 3;                                 
    overResult = 0;
    [ourScore] = our3pointer(ourScore,my3);    
    if ourScore == 3                                % if we make our buzzer beater 3 we go to overtime
        [overResult] = overtime(overProb);          % we simulate overtime, over stores a value of 1 for a win and 0 for a loss
        win2 = win2 + overResult;                   % if we won, over = 1 and will add a win, if we lost 'win' will not change in value
    end
end

%% 
prob2Point = 100*win1/N;
prob3Point = 100*win2/N;

if my2 == 0.4
    prob = 'a';
elseif my2 == 0.6
    prob = 'b';
end

fprintf('The probability of winning with the 2 point strategy over %.0f trials using the probabilities in %s is %6.3f%%.\n', N ,prob, prob2Point);
fprintf('The probability of winning with the 3 point strategy over %.0f trials using the probabilities in %s is %6.3f%%.\n', N ,prob, prob3Point);       

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        