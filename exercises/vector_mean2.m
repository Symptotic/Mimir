function [M]= vector_mean2(X) %A = randint(1,4,[0 9])
[n,m] = size(X) ;
if (n~=1 && m~=1) 'it is not a vector, asshole!!!'
end
A = ones(size(X))';
if (n==1)
    s=X*A;
  M=s/m; 
end
if(m==1)
    s=A*X;
    M=s/n;
end
