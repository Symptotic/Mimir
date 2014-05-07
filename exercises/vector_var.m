function [var]= vector_var(X) %A = randint(1,4,[0 9])
[n,m] = size(X) ;
if (n==1)
    for  i  = 2:m;
        d(1)=X(n,1);
        d(i) = X(n,i)+d(i-1);
    end
    s=d(m)/m; %mean
    for i =2:m
       v(1)= (X(n,1)-s)^2;
       v(i)= (X(n,i)-s)^2+v(i-1);
    end
var=(1/(m-1))*v(m); %var
end
if (m==1)
    for  i  = 2:n;
        d(1)=X(1,m);
        d(i) = X(i,m)+d(i-1);
    end
     s=d(n)/n;
     for i =2:n
       v(1)= (X(1,n)-s)^2;
       v(i)= (X(i,n)-s)^2+v(i-1);
    end
var=(1/(n-1))*v(n);
end
if (n~=1 && m~=1) 'it is not a vector, asshole!!!'
end
