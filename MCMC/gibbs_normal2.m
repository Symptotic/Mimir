function [mu, tau] = gibbs_normal2(x, priors, N)
n = length(x); %���������� ���������� 
mu = zeros(N+1,1);
tau = zeros(N+1,1);
mu(1) = mean(x); % ��������� �����, � �����,  ����� ���� ����� ������������� ������
tau(1) = 1 / var(x);

for i = 2:N+1
    sigma = (1/(n*tau(i-1)+priors(2))^2);
     m = (tau(i-1)*sum(x)+priors(1)*priors(2))/(n*tau(i-1)+priors(2));
     mu(i) = m+sigma^0.5*randn; % �����������  mu(i)|tau(i-1) ��� mu(i) ��� ��������� �������� � ����������� m(tau(i-1)) sigma(tau(i-1))
     a = priors(3)+ n/2;
     b = priors(4) + sum((x-mu(i)).^2)/2 ;
     tau(i) = gamrnd(a,1/b); % �����������  tau(i)|mu(i)
     
%      P(i,1)=mu(i) ; 
%      P(i,2)=tau(i); 
end
mu = mu(10:end); % ����������� ������ 10 ����������
tau = tau(10:end);