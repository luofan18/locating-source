function [I, step] = infect(G, seeds, beta, minInfected)

step = 0;
[nodeNum, ~] = size(G); 
I = zeros(1, nodeNum);
I(seeds) = 1;
while sum(I) <= minInfected
    if sum(I) == 1
        attackDegree = G(find(I),:);
    else
        neighborI = G(find(I),:);
        attackDegree = sum(neighborI);
    end
    neighborIID = find(attackDegree);
    % delete the node already infected
    neighborIID = setdiff(neighborIID,find(I));
    p = 1-(1-beta).^attackDegree(neighborIID);
    successfulAttack = binornd(ones(1,numel(p)), p);
    I(neighborIID(successfulAttack==1)) = 1;
    step = step + 1;
end