function [C] = crossdel(A,dstr,drow)
[n,m] = size(A);
B =[A(1:(dstr-1),1:m); A((dstr+1):n,1:m)]; 
[n,m] = size(B);
C =[B(1:n,1:(drow-1)), B(1:n,(drow+1):m)]; 
end

