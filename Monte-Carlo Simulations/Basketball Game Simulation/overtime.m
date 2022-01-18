function [overResult] = overtime(overProb)
% Inputs:
% overProb: input the probability of us winning in overtime
% Outputs: 
% overResult: gives a value 0 (we lost the game) or 1 (we won the game)
game = rand();
if game <= overProb
    overResult = 1;
elseif game> overProb
    overResult = 0;
end
end