% inputs: i, chara, prods, w
%         i: an index >=1
%         chara, prods: two tables containing respectively the 
%                       personal informations
%                       and the purchase history
%                       w is a weight between 0 and 1.
% output: a list, possibly empty, of products not yet purchased 
%         by customer i, recommended by our system
function res = recommend(i,chara,prods,w)
index = findMostSimilarCustomer(i, chara, prods,w);
pi = prods(i,:);
pj = prods(index,:);
res= [];
for p=1:length(pi)
    if (pj(p)==1) && (pi(p)==0)
       res = [res,p];
    end
end
end
