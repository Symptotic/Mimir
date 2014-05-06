clear; clc;
N = 110000;
n = 10000;
m = [0, 0];
V = [1, 0.5; 
     0.5, 1];
[x] = gibbs_normal(N, n, m, V);
disp(x);
V_estx = cov(x);