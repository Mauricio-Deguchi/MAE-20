function [possession] = theirOffensiveReboundFree(offRebF)
% Inputs:
% none: the functions simulates their odds of getting a rebound after their
% freethrow
% Outputs: 
% possession: a numerical value of 0 (their possession) or 1 (our possession)
rebound = rand();
offRebF = 0.15;     % offensive rebound freethrow

if rebound <= offRebF
   possession = 0;
elseif rebound > offRebF
    possession = 1;
end
end