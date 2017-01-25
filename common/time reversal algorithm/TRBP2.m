 function [ SS ] = TRBP2( G, beta, D, F )
%TRBP time-reversal backword propagation algorithm
%   G   graph
%   beta
%   D   indicator for infected nodes
frontierNode = find(F);
infected = find(D);

delayMatrix = graphallshortestpaths(G);
delayMatrix = delayMatrix(F==1,D==1);
meanDelay = sum(delayMatrix)/numel(infected);
variance = sum((delayMatrix - repmat(meanDelay,numel(frontierNode),1)).^2)/sum(F);
[~,index] = min(variance);
SS = zeros(size(D));
SS(infected(index)) = 1;

end

