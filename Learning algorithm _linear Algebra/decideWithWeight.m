function res = decideWithWeight (w, set)
[pg, ew0, sigw0, ew1, sigw1, es0, sigs0, es1, sigs1] = findParameters (set);
p0 = (1/(sqrt(2*pi)*sigw0))*exp(-(w-ew0)^2/(2*sigw0^2));
p1 = (1/(sqrt(2*pi)*sigw1))*exp(-(w-ew1)^2/(2*sigw1^2));
p = (p0*pg)/((p0*pg)+(p1*(1-pg)));
if p > 0.5
    res = 0;
else 
    res = 1;
end
end