clear; clc;
% Generates AR(1) – time series process
T = 100; % T = number of observations
c =  0.9; % ñ = constant of the process
fi = 0.5; % fi = coefficient
sigma2 = 1;% sigma2 = variance of epsilon; epsilon is a noise of the prosess 

%Start timer
itime=cputime;

epsilon = (sigma2^0.5).*randn(T,1);
y = zeros(T,1);
y(1) = ((sigma2/(1-fi^2))^0.5).*randn(1,1) + c/(1-fi);
for t = 2:T
   y(t) = c + fi*y(t-1) + epsilon(t); 
end