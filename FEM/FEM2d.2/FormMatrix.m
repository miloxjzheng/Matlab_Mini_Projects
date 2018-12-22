function res = FormMatrix(n)
a = (n+1)*(n+1);
L = zeros(a, a);
for i = 1:a
    b= rem(i,(n+1));
    q = fix(i/(n+1));
    if q == 0
        L(i, i) = 1;
    elseif q == n
        L(i, i) = 1;    
    else
        if b == 0
            L(i, (n+1)*q) = 1;
        elseif b == 1
            L(i, (n+1)*q+1) = 1;
        else
            L(i, (n+1)*q+b) = 8/3;
            L(i, (n+1)*q+b+1) = -1/3;
            L(i, (n+1)*q+b+n+1) = -1/3;
            L(i, (n+1)*q+b+n) = -1/3;
            L(i, (n+1)*q+b+n+2) = -1/3;
            L(i, (n+1)*q+b-1) = -1/3;
            L(i, (n+1)*q+b-n) = -1/3;
            L(i, (n+1)*q+b-n-1) = -1/3;
            L(i, (n+1)*q+b-n-2) = -1/3;
        end
    end
end
res = L;
end


    
        
