function [B]= genMat(n)
m=n;
B= zeros(n,m) ;
for j  = 1:m; 
for  i  = 1:n; 
    B (i,j)= 0+i; 
end
end



