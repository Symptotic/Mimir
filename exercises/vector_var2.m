function [var]=vector_var2(X) %A = randint(1,4,[0 9])
[n,m] = size(X) ;
if (n~=1 && m~=1) 'it is not a vector, asshole!!!'
end
A = ones(size(X))';
if (n==1)
    sum=X*A;
  mean=sum/m; 
  var=(1/(m-1))*(X-mean)*(X-mean)';
end
if(m==1)
    sum=A*X;
    mean=sum/n;
    var=(1/(n-1))*(X-mean)'*(X-mean);
end