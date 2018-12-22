function res = decideWithFSize (s, set)
[pg, ew0, sigw0, ew1, sigw1, es0, sigs0, es1, sigs1] = findParameters (set);
p0 = (1/(sqrt(2*pi)*sigs0))*exp(-(s-es0)^2/(2*sigs0^2));
p1 = (1/(sqrt(2*pi)*sigs1))*exp(-(s-es1)^2/(2*sigs1^2));
p = (p0*pg)/((p0*pg)+(p1*(1-pg)));
if p > 0.5
    res = 0;
else 
    res = 1;
end
end