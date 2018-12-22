function [pg, ew0, sigw0, ew1, sigw1, es0, sigs0, es1, sigs1] = findParameters (A)
M = 0;
F = 0;
w0 = 0;
w1 = 0;
s0 = 0;
s1 = 0;
vw0 = 0;
vw1 = 0;
vs0 = 0;
vs1 = 0;
[a, ~] = size(A);
for i = 1:a
    if A(i, 1) == 0
        M = M+1;
        w0 = w0+A(i, 2);
        s0 = s0+A(i, 3);
    elseif A(i, 1) == 1
        F = F+1;
        w1 = w1+A(i, 2);
        s1 = s1+A(i, 3);
    end
end
pg= M/a;
ew0 = w0/M;
es0 = s0/M;
ew1 = w1/F;
es1 = s1/F;
for i = 1:a
    if A(i, 1) == 0   
        vw0 = vw0+(A(i, 2)-ew0)^2;
        vs0 = vs0+(A(i, 3)-es0)^2;
    elseif A(i, 1) == 1
        vw1 = vw1+(A(i, 2)-ew1)^2;
        vs1 = vs1+(A(i, 3)-es1)^2;
    end
end
sigw0=sqrt(vw0/M);
sigs0=sqrt(vs0/M);
sigw1=sqrt(vw1/F);
sigs1=sqrt(vs1/F);
end