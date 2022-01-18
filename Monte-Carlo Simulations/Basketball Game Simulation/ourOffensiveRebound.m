function [possession] = ourOffensiveRebound(offRebR)
% Inputs:
% offRebR: input the probability of us obtaining an offensive rebound
% Outputs: 
% possession: a numerical value of 0 (their possession) or 1 (our possession)
rebound = rand();


if rebound <= offRebR
    possession = 1;
elseif rebound > offRebR
    possession = 0;
end
end





