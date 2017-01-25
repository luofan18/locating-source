function [ SS ] = myMultipleJordanCenter( G,I,seedsNum,allShortestPaths,iterations )
%MYMUTIPLEJORDANCENTER 
%   
I = I == 1;
% allShortestPaths = graphallshortestpaths(G);
SS = zeros(size(I));
infectedPaths = allShortestPaths(I,I);

% initializing
infected = find(I);

if seedsNum == 1
    rowMax = max(infectedPaths,[],2);
    [~,columnMin] = min(rowMax);
    SS(infected(columnMin)) = 1;
    return
end

% else the seedsNum larger than 1
[~,maxIndex] = max(infectedPaths(:));
[seeds(1),seeds(2)] = ind2sub(size(infectedPaths),maxIndex);
seeds(1,:) = infected(seeds(1,:));
SS(seeds) = 1;

if seedsNum > 2
    for i = 3:seedsNum
       [~,maxIndex] = max(min(allShortestPaths(SS==1,I)));
       SS(infected(maxIndex)) = 1;
    end
end

% iterations
for i = 1:iterations
    % covering
    distance = allShortestPaths(SS==1,I);
    [~,component] = min(distance,[],1);
    % optimazing
    for j = 1:seedsNum % also numbers of components
        subPaths = infectedPaths(component==j,component==j);
        rowMax = max(subPaths,[],2);
        [~,columnMin] = min(rowMax);
        componentI = find(component==j);
        seeds(j) = infected(componentI(columnMin));
    end
    SS = zeros(size(I));
    SS(seeds) = 1;
end
