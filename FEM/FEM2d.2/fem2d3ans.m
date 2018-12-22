n = 128;
a = (n+1)*(n+1);
%use the g0(y) = g1(y) = h0(x) = h1(x) = 1 and f(x,y) = 0
b = zeros(a,1); 
for i = 1:a
    q= fix(i/(n+1));
    p = rem(i, n+1);
    if q == 0 || q == n || p == 0 || p==1
        b(i,1) = 1;
    end
end
A = FormMatrix(n);
L = sparse(A);
ans = L\b