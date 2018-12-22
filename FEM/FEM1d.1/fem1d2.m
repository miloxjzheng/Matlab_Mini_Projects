function res = fem1d2(n)
b = zeros(n+1, 1);
b(1, 1) = 1;
b(n+1, 1) =1;
for i = 2:n
    h = 1/n;
    b(i, 1) = -h;
end
L = FormMatrix(n);
res = L\b;
end
