function [ C ] = matrixcofactor( A )
%MATRIXCOFACTOR calculate the cofactor matrix of A
%   A should be sqaure
[m,n] = size(A);
if m ~= n,
   disp([[blk blk blk] ['Error: matrix is not square.']])
   return
end

C = zeros(m,n);
for i = 1:m
    for j = 1:n
        C(m,n) = cofactor(A,m,n);
    end
end

end

