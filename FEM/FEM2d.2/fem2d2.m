function res=fem2d2(n)
a = (n+1)*(n+1);
b = zeros(a,1);
for i = 1:a
    q = fix(i/(n+1));
    p = rem(i, n+1);
    h = 1/n;
    y =(p-1)*h;
    x = q*h;
    if q == 0 && p ~= 0
        b(i, 1) = y^2;
    elseif q == n  && p ~= 1
        b(i, 1) = 1+ y^2;
    elseif q == n+1
        b(i, 1) = 1+(n*h)^2; 
    elseif p == 0 && q ~= (n+1)
        b(i, 1) = x^2;
    elseif p == 1
        b(i, 1) = 1+x^2;
    else
        b(i, 1) = -4*h^2;
    end
end
L = FormMatrix(n);
res = L\b;
end