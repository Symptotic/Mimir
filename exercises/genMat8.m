function [B]= genMat8(k)
m=2*k;
n=m;
B= zeros(n,m) ;
for i  = 1:k;
        for j  = 1:k;
            if ((i-1)<=k-1 &&(j-1)<=k-1)  B (i,j)=1;
            end
        end
    end
for i  = 1:k;
        for j  = (k+1):n;
            if ((i-1)<=k-1 &&(j-1)<=2*k)  B (i,j)=2;
            end
        end
end
 for i  = (k+1):n;
        for j  = 1:k;
            if ((i-1)<=2*k &&(j-1)<=k-1)  B (i,j)=3;
            end
        end
end   
for i  = (k+1):n;
        for j  = (k+1):n;
            if ((i-1)<=2*k &&(j-1)<=2*k)  B (i,j)=4;
            end
        end
end   