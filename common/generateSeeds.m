function seeds = generateSeeds(G, seedsNum, bins, binSize, binNum)

seeds = zeros(1,seedsNum);

rng('shuffle');
selectBin = randi([1 binNum], 1, seedsNum);
selectSeeds = zeros(1,seedsNum);
for i = 1:seedsNum
    selectSeeds(i) = randi([1 binSize(selectBin(i))]);
    seeds(i) = bins(selectBin(i),selectSeeds(i));
end
% in case the some nodes are identical, regenerate seeds
while (numel(unique(seeds))~=numel(seeds))
    selectBin = randi([1 binNum], seedsNum);
    selectSeeds = zeros(1,seedsNum);
    for i = 1:seedsNum
        selectSeeds(i) = randi([1 binSize(selectBin(i))]);
        seeds(i) = bins(selectBin(i),selectSeeds(i));
    end
end

end