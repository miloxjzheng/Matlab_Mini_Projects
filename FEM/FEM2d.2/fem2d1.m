function res = fem2d1(n)
a = (n+1)*(n+1);
b = zeros(a,1);
for i = 1:a
    q= fix(i/(n+1));
    p = rem(i, n+1);
    if q == 0 || q == n || p == 0 || p==1
        b(i,1) = 1;
    end
end
L=FormMatrix(n);
res=L\b;
end
