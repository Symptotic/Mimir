function [B]= genMat4(n)
m=n;
e=m+n;
B= zeros(n,m) ;
for k  = 2:e;
    for j  = 1:n;
        for i  = 1:n;
            if (k == j+i && k-1<=e/2)
                B (i,j)= k-1;
            end
            if (k == j+i && k-1>e/2)
                B (i,j)= e-k+1;
            end
        end
    end
end
