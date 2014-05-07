function [s]= subdiag_sum(X) %A = randint(3,4,[0 9])
[n,m] = size(X) ;
for  i  = 1:m; 
    d(i) = X(i,n-i+1); 
end
s=sum(d)


