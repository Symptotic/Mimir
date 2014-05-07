%% Aggregate two matrix
%
%
%  written by:
%      Artem Yazykov
%      Subdepartment of Mathematical Economics and Econometrics
%      Higher School of Economics
%
%%
%  Disclaimer:  No guarantee that this code is free of bugs.
%                      If you find any mistakes please email yazikov87@gmail.com
%%

function[X_aggr] = aggrmat2(X,Y);
[n1,k1] = size(X);
[n2,k2] = size(Y);
if (n1 ~= n2)
     error('numb of abs arnt equal');
else
      X_aggr = zeros(n1+n2,k1+k2); 
      X = [X, zeros(n2,k2)];
      Y = [zeros(n1,k1), Y];
      a = 0;
      b = 0;
      for i = 1:(n1+n2)
          if (rem(i,2) == 0) 
             a = a+1;   
    X_aggr(i,:)=X(a,:);
          else
              b = b+1;
    X_aggr(i,:)=Y(b,:);   
          end
      end             
end

