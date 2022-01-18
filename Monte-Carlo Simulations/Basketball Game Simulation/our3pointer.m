function [ourScore] = our3pointer(ourScore, my3)
% Inputs:
% ourScore: input the value of our team (LeBron's team)
% my3: input the probability of us scoring a 3 pointer
% Outputs: 
% ourScore: the score of LeBron's team after shooting a 2 pointer
% time: the reduced time after having taken a shot
% possession: a numerical value of 0 (their possession) or 3 (our chance at a rebound)
three1 = rand();
if three1 <= my3                         
    ourScore = ourScore + 3; 
end
end



