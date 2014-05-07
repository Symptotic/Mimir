function [B]= genMat2(n)
m=n;
B= zeros(n,m) ;
for j  = 1:n;
for i  = 1:n; 
    B (i,1)= 0+i;
    B (1,j)= 0+j;
    B (j+1,j)= j+2;
    B (j,j+1)= j+2;
end
end
