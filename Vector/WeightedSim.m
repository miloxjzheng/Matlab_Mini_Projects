% inputs: ci,cj, pi,pj, w
% ci,pi are respectively the personal and purchase informations of a customer i,
% cj,pj are the one a customer j.
% w is a weight between 0 and 1.
% output: the weighted similarity between custumer i and j profiles.
function sim = WeightedSim(ci,cj,pi,pj,w)
    s1 = sum(ci.*cj)/(norm(ci)*norm(cj));
    s2 = sum(pi.*pj)/(norm(pi)*norm(pj));
    sim = w*s1 +(1-w)*s2;
end