function [ bins, binSize ] = putTheNodeInBins( G, M )
%PUTTHENODEINBINS 
%   All the node with degree < M will be put into bin m, those with node
%   degree greater than M will be put into bin M. Totally there are M
%   bins.
degree = sum(G);
[~, F] = mode(degree);
cursor = ones(1,M);
bins = zeros(M,max(F));
% bins = sparse(1,1,0,M,ceil(F*numel(degree)),numel(degree));
for i = 1:numel(degree)
    if degree(i) < M
        bins(degree(i),cursor(degree(i))) = i;
        cursor(degree(i)) = cursor(degree(i)) + 1;
    else
        bins(M,cursor(M)) = i;
        cursor(M) = cursor(M) + 1;
    end
end
cursor = cursor - 1;
binSize = cursor;

