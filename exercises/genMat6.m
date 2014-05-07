function [B]= genMat6(n,rho)
r=rho;
m=n;
e=m+n;
B= zeros(n,m) ;
for k  = 2:e;
    for j  = 1:n;
        for i  = 1:n;
            if (k == j+i && j == i)
                B (i,j)= r^0;
            end
            if (k == j+i && k-1<=e/2 && j ~= i )
                B (i,j)= r^(k-1);
            end
            if (k == j+i && k-1>e/2 && j ~= i)
                B (i,j)= r^(e-k+1);
            end
        end
    end
end
