function QsdScore = Qsd(seeds, trueSeeds, maxDistance, allShortestPaths)

% the portion of seeds within the range

assert(numel(seeds)==numel(trueSeeds),'Seeds set must have same number of nodes');

seedsNum = numel(seeds);

dist = allShortestPaths(seeds,trueSeeds);

succeed = 0;
for i = 1:seedsNum
    [M,~,ICol] = findSmallest(dist);
    if M <= maxDistance;
        dist(:,ICol) = realmax();
        succeed = succeed + 1;
    end
end

QsdScore = succeed / seedsNum;