function res = decideWithBoth (w, s, set)
[pg, ew0, sigw0, ew1, sigw1, es0, sigs0, es1, sigs1] = findParameters (set);
pw0 = (1/(sqrt(2*pi)*sigw0))*exp(-(w-ew0)^2/(2*sigw0^2));
pw1 = (1/(sqrt(2*pi)*sigw1))*exp(-(w-ew1)^2/(2*sigw1^2));
ps0 = (1/(sqrt(2*pi)*sigs0))*exp(-(s-es0)^2/(2*sigs0^2));
ps1 = (1/(sqrt(2*pi)*sigs1))*exp(-(s-es1)^2/(2*sigs1^2));
p = (pw0*ps0*pg)/((pw0*ps0*pg)+(pw1*ps1*(1-pg)));
if p > 0.5
    res = 0;
else 
    res = 1;
end
end