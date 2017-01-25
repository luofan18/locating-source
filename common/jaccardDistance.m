function [ distance ] = jaccardDistance( s1,s2 )
%jaccardDistance calculate Jaccard distance of the two set, the small, the
%more similarity
%   Input    set a,b
if nargin==0
    s1=[1,2,3];
    s2=[2,3,5,6,7];
end

num=max(max(s1),max(s2));
a=zeros(1,num);
b=zeros(1,num);
for i=1:numel(s1)
    a(s1(i))=1;
end
for i=1:numel(s2)
    b(s2(i))=1;
end

distance = 1 - sum(a & b)/sum(a | b);

end

