function [M, IRow, ICol] = findSmallest(A)

[M, I] = min(A(:));
[IRow, ICol] = ind2sub(size(A), I);