function [ SS ] = randomSelectSeedsInInfection( I, seedsNum )
%RANDOMSELECTSEEDSININFECTION Summary of this function goes here
%   Detailed explanation goes here
SS = zeros(size(I));
rng('shuffle');
infected = find(I);
SS(infected(randi([1 sum(I)], 1, seedsNum))) = 1;
while sum(SS) ~= seedsNum
    SS = zeros(size(I));
    SS(infected(randi([1 sum(I)], 1, seedsNum))) = 1;
end

end

