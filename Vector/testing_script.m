%loading the database
database
%print the profile of the first custumer:
% personnal informations:
chara(1,:);
% history of purchases:
prods(1,:);

%Question 1:
% the function WeightedSim is implemented in WeightedSim.m
% Here we try the function to compute the weightd similarity
% between customer 1 and 1 (Should be 1!!!)
WeightedSim(chara(1,:),chara(1,:),prods(1,:),prods(1,:),0.7)
% between customer 1 and 2
WeightedSim(chara(1,:),chara(2,:),prods(1,:),prods(2,:),0.7)

%Question 2:
% the function findMostSimilarCustomer is implemented in findMostSimilarCustomer.m
% Here we try the function to find the customer 
% that has the profile that is the most similar to the one of 
% the first customer
test = findMostSimilarCustomer(1, chara, prods,0.7) 
% just to see the similarity
WeightedSim(chara(1,:),chara(test,:),prods(1,:),prods(test,:),0.7)
% just to test, assuming that test+1 <= length(chara)
WeightedSim(chara(1,:),chara(test+1,:),prods(1,:),prods(test+1,:),0.7)

%Question 3:
% the function recommend is implemented in recommend.m
res = recommend(1,chara,prods,0.7)