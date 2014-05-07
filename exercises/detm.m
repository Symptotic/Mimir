function [ det ] = detm(A )
[n,m] = size(A) ;
if (n~=m) 'it is not a square matrix , dumb!!!'   
end
for  i  = 1:m;
    M=crossdel(A,1,i );
    minor=(M(1,1)*M(2,2)-M(1,2)*M(2,1));
    [n,m] = size(  M(i)) ;
  d(i)=((-1)^(1+i))*A(1,i)*minor;
end
det=sum(d);

% A(1,1)*A(2,2)-A(1,2)*A(2,1);
     


