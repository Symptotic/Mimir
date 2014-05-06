clc; clear;
N = 11000;
n = 1000;
T = 50;
mu_true = 3;
tau_true = 0.25;
x = mu_true + sqrt(1/tau_true) * randn(T,1);
mu = zeros(N+1,1);
tau = zeros(N+1,1);
mu(1,1) = mean(x);
tau(1,1) = 1 / var(x);

L0 = 0; W0 = 1; A0 = 1; B0 = 1;
  
for i = 2:N+1
    c11 = tau(i-1,1) * sum(x) + L0 * W0;
    c12 = T * tau(i-1,1) + W0;
    C1 = c11 / c12;
    C2 = 1 / c12;
    mu(i,1) = C1 + sqrt(C2) * randn;
    
    C3 = A0 + T / 2;
    C4 = B0 + 0.5 * sum((x - mu(i,1)).^2);
    tau(i,1) = gamrnd(C3,C4);
end

mu = mu(n+1:end,:);
tau = tau(n+1:end,:); 