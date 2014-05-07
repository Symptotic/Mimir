function [Y]= gen_Y(X,b,s)
[n,m] = size(X) ;
e = s * randn(n,1) ;
Y = X * b + e;