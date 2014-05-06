function [y] = generateSV(T, alfa, fi, sigma_eta2)
% Generates SV – time series process
epsilon = randn(T+1,1);
eta = (sigma_eta2^0.5)*randn(T+1,1);
y = zeros(T+1,1);
h = zeros(T+1,1);
h(1) = alfa/(1-fi) + ((sigma_eta2/(1-fi^2))^0.5)*randn;

for t = 2:T+1
    h(t) = alfa + fi*h(t-1) + eta(t);
    y(t) = exp(h(t)/2)*epsilon(t);
end

y = y(2:T+1);