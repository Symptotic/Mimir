gibbs_MVP
z0=zeros(n,J);
% Z
% Y
% Beta
% R
% alpha
% Psy_star    covariance from multivariate normal distribution
 % D diagonal matrix with positive diagonal elements d_ii 
 % !!!!! The scale parameter  D is not identiable. For reasons which will become clear later,

 % d_ii = (Sigma_ii)^0.5
% r^ii  is the ith diagonal element of R^-1
% W = t_alpha(Z) = DZ
% e* = D(Z -X*beta).
% Sigma


%%IMPUTATION STEP

%Draw Z ~ f(Z|Y,Beta,R) from a truncated Multivariate Normal distribution TMV N(XBeta,R)

%%%%%%%%%
%Sample Latent 4
     for l=1:n
         z0(l,:)=rmvtnorm(Xbhat(l,:)',Rinv,z0(l,:)',y(l,:)',[-Inf 0 Inf])';
     end
%%%%%%%%%%%%

%%POSTORIOR SAMPLING STEP.  Draw (Beta,R,alpha) jointly conditional on the latent data
for s = 0:N

% Draw Beta|Z,Y,R  from a Multivariate Normal distribution 
%Beta ~ MNV(Beta*, Psy*_beta)
part = 0;
R_inv = inv(R(s-1));
for i = 1:n
    part = part + X(i)'*R_inv*X(i);
end
psy_star(s)  = psy + part;

part = 0;
for i = 1:n
    part = part + X(i)'*R_inv*Z;
end
beta_star(s)= inv(psy_star)*part;

beta(s) = mvnrnd(beta_star(s), psy_star(s));

%Draw alpha ~ p_o(alpha|R) from a Gamma distribution G(T+1/2,1)
alpha = gamrnd((T+1)/2,1); % generates random numbers from the gamma distribution with shape parameters in A and scale parameters in B

% Compute th dioganal matrix D, where each diagonal  element 
% d_i =(r^ii/2alpha_i)^0.5 and r^ii is the ith diagonal element of R^-1.

D = eye();
for i = 1: 
   D(i,i) =   (R_inv(i,i) / (2 * alpha(i)))^0.5;
end
D(s) = D;



% compute W = t_alpha(Z) = DZ or equivalently  e* = D(Z -X*beta).
 e_star(s)  = D(s)*(Z -X*beta(s));


% Draw Sigma|Beta,Y,W; from an inverse Wishart distribution 
% Sigma ~IW(v,S) where v=n+T+1 and S=e*'e*
S(s) = e_star(s)' * e_star(s) ;
v=n+T+1; %degrees of freedom
Sigma(s) = iwishrnd(S(s),v);  % generates a random matrix from the inverse Wishart distribution


% compute R = D^-1*Sigma*D^-1
R(s) =  inv(D(s))*Sigma(s)*inv(D(s));

end