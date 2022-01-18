function [theirScore, possession, time] = theirPossesion(theirScore, time, theirFree)
% Inputs:
% time: the time when they get possession
% theirScore: the numerical value of their points
% Outputs: 
% theirScore: an updated value of their points based on if they make their
% freethrows
% possession: a numerical value of 1 (our possession) or 2 (their chance at a rebound)
% time: an updated time after we fouled them when they had possession                                     
time = time - 5;                    % we are loosing the game and will foul
free1 = rand();                     
free2 = rand(); 
if free1 <= theirFree
    theirScore = theirScore + 1;
end

if free2 <= theirFree
    theirScore = theirScore + 1;
    possession = 1;
elseif free2 > theirFree
    possession = 2;
end
end





