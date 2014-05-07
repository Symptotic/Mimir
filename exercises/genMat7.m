function [B]= genMat7(n)
m=2*n-1;
k=m;
B= zeros(m,k);
for l = 0:n;
    for j  = 1:m;
        for i  = 1:m;
%             if (abs(j-n)==l && abs(i-n)==l)   B (i,j)= 1+l;
%             end
 if (abs(j-n)==l || abs(i-n)==l)   B (i,j)= 1+l;
            end
            end
        end
    end
end

