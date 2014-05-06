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

function[X_aggr] = aggrmat(X,Y);
[n1,k1] = size(X);
[n2,k2] = size(Y);
if (n1 ~= n2)
     error('numb of abs arnt equal');
else
    X_aggr=[X, zeros(n2,k2);
                   zeros(n1,k1), Y];
end

