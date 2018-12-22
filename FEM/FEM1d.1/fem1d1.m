function res = fem1d1(n)
b = zeros(n+1, 1);
b(1, 1) = 1;
b(n+1, 1) = 1;
L = FormMatrix(n);
res = L\b;
end


