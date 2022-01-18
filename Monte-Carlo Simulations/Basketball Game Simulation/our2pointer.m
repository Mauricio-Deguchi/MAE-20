function [ourScore, time, possession] = our2pointer(ourScore,time, my2)
% Inputs:
% ourScore: input the value of our team (LeBron's team)
% time: input how much time there is before the 2 point shot
% my2: input the probability of us scoring a 2 pointer
% Outputs: 
% ourScore: the score of LeBron's team after shooting a 2 pointer
% time: the reduced time after having taken a shot
% possession: a numerical value of 0 (their possession) or 3 (our chance at a rebound)
two1 = rand();
time = time-5;

if t1 <= my2wo                          
    ourScore = ourScore + 2; 
    possession = 0;
elseif two1 > my2
    possession = 3;
end
end


