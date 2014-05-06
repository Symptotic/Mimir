%% Генерация данных.
clear; clc;
T = 2000;


b_true = [1 2 3]'; % коэффициенты для симуляции процесса У
sigma_true = 1;
k = length(b_true) ;
Y = zeros(T,1);
X = [ones(T,1), randn(T,k-1)]; % произвольный Х
Z = X*b_true+ randn(T,1);
for i=1:T
    if Z(i)>0
        Y(i)=1;
    else
        Y(i)=0;
    end
end

