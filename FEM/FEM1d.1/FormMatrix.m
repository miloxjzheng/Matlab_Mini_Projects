function res = FormMatrix(n)
h=1/n;
L= zeros(n+1, n+1);
for i = 1:n+1
    if i == 1
        L(i, i) = 1;
    elseif i == n+1
        L(i, i) = 1;
    else
        L(i, i-1) = -1/h;
        L(i, i) =  2/h;
        L(i, i+1) = -1/h;
    end
end
res = L;
end
        