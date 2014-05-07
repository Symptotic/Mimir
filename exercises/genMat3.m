function [B]= genMat3(n)
m=n;
e=m+n;
B= zeros(n,m) ;
for k  = 1:e;
    for j  = 1:m;
        for i  = 1:n;
            if (k == j || k == i)
                B (i,j)= k;
            end
        end
    end
end

