% inputs: i, chara, prods, w
%         i: an index >=1
%         chara, prods: two tables containing respectively the 
%                       personal informations
%                       and the purchase history
%         w is a weight between 0 and 1.
% output: the index of the customer that has the more similar profile 
%         to the one of customer i, according to WeightedSim
function index = findMostSimilarCustomer(i, chara, prods,w) 
ci = chara(i,:);
pi = prods(i,:);
[m, ~]=size(chara);
index=0;
simo=0;
for j=1:m 
    if (j ~= i)
        cj =chara(j,:);
        pj =prods(j,:);
        s1 = sum(ci.*cj)/(norm(ci)*norm(cj));
        s2 = sum(pi.*pj)/(norm(pi)*norm(pj));
        sim = w*s1 +(1-w)*s2;
        if (sim>simo)
            simo=sim;
            index=j;
        end
    end
end
end
