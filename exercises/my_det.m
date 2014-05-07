function [rez] = my_det(A)
n = max(size(A));
if ( n == 1)
rez = A; return
end
rez = 0;
for i = 1:n
if (i==1)
tmpA = A(2:n, 2:n);
elseif (i==n)
tmpA = A(1:n-1, 2:n);
else
tmpA = [A(1:i-1,2:n); A(i+1:n,2:n)];
end
rez = rez + A(i,1)*((-1)^(i+1))*my_det(tmpA);
end