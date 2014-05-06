function [x] = gibbs_normal(N, n, m, V)
d = 2;
z = randn(N+1,d);
x = zeros(N+1,d);
m1 = m(1); m2 = m(2);
s1 = sqrt(V(1,1)); s2 = sqrt(V(2,2));
rho = V(1,2) / (s1*s2);
s1c = s1 * sqrt(1 - rho^2);
s2c = s2 * sqrt(1 - rho^2);

for i = 2:N+1
    x(i,1) = m1 + rho * (s1/s2) * (x(i-1,2) - m2) + s1c * z(i,1);
    x(i,2) = m2 + rho * (s2/s1) * (x(i,1)   - m1) + s2c * z(i,2);
end
x = x(n+1:end,:);