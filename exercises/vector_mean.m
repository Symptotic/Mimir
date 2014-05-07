function [s]= vector_mean(X) %A = randint(1,4,[0 9])
[n,m] = size(X) ;
if (n==1)
    for  i  = 2:m;
        d(1)=X(n,1);
        d(i) = X(n,i)+d(i-1);
    end
    s=d(m)/m;
end
if (m==1)
    for  i  = 2:n;
        d(1)=X(1,m);
        d(i) = X(i,m)+d(i-1);
    end
     s=d(n)/n;
end
if (n~=1 && m~=1) 'it is not a vector, asshole!!!'
end
