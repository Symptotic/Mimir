clc; clear;
N = 110;
n = 1000;
T = 50;
mu_true = 3;
tau_true = 0.75;
x = mu_true + sqrt(1/tau_true) * randn(T,1);

priors = [0 1 1 1];