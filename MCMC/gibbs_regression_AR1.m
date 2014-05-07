%% ��������� ������.
clear; clc;
T = 200;
b_true = [10 2 3]'; % ������������ ��� ��������� �������� �
phi_true = 0.1; % ������������ ��� ��������� �������� z --- AR(1)
sigma_true = 10;
a = sigma_true * randn(T+1,1);
z = zeros(T+1,1);
z(1,1) = sqrt(sigma_true^2 / (1 - phi_true^2)) * randn;
for t = 2:T+1
    z(t,1) = phi_true * z(t-1,1) + a(t,1);
end
z = z(2:end,:);
k = length(b_true) - 1;
X = [ones(T,1), randn(T,k)]; % ������������ �
Y = X * b_true + z;
%% ������ ���������� ������� MCMC.
N = 1000;
n = 100;
b = zeros(k+1,N+1);
phi = zeros(1,N+1);
sigma = zeros(1,N+1);
sigma(1,1) = 1;
SIGMA0 = eye(k+1,k+1); % eye(d,d) - ��� dxd-������ ��������� �������.

for i = 2:N+1
    % ��������� b.
    Y0 = Y - phi(1,i-1) * lagmatrix(Y,1); % ������������ ����������
    Y0 = Y0(2:end,:);    % ������� ������ �������� ��� ��� ��� �� ����������
    X0 = X - phi(1,i-1) * lagmatrix(X,1);
    X0 = X0(2:end,:);
    b_hat = (X0' * X0) \ (X0' * Y0);
    % b_hat = inv(X0' * X0) * (X0' * Y0);
    SIGMA_inv_star = X0' * X0 / (sigma(1,i-1)^2) + inv(SIGMA0);
    b_star = inv(SIGMA_inv_star) * ( (X0' * X0) * b_hat / (sigma(1,i-1)^2) + inv(SIGMA0) * b(:,1) );
    b(:,i) = b_star + SIGMA_inv_star ^ (-0.5) * randn(k+1,1);
    
    % ��������� phi.
    z = Y - X * b(:,i);
    phi_hat = (z(1:end-1,1)' * z(2:end,1)) / (z(1:end-1,1)' * z(1:end-1,1));
    sigma2_inv_star = sum(z(1:end-1,1).^2) / (sigma(1,i-1)^2) + sigma(1,1)^2;
    phi_star = inv(sigma2_inv_star) * ( sum(z(1:end-1,1).^2) * phi_hat / (sigma(1,i-1)^2) +  sigma(1,1)^(-2) * phi(1,1));
    phi(1,i) = phi_star + sigma2_inv_star^(-0.5) * randn(1,1);
    
    % ��������� sigma.
    a = z - phi(1,i) * lagmatrix(z,1);
    a = a(2:end,:);
    % ������ ��������� nu � lambda.
    nu = 20; lambda = 0.1;
    sigma(1,i) = sqrt((nu * lambda + sum(a.^2)) / chi2rnd(nu + T - 1));
end
b = b(:,n+2:N+1);
phi = phi(1,n+2:N+1);
sigma = sigma(1,n+2:N+1);

    
    
    
    
    
    
