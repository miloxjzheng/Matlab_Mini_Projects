% inputs:
%--------
% inter : the coordinates of a point in the standard basis
%       : inter lies in the plane of the patch
% k     : the index of a patch 
% Points: the v*3 array containing the matrices of the scene
% Scene : the m*3 array which k-th row contains the 
%         indexes in Points of the vertices of the k-th patch
% output: 
%--------
% 1 if inter lies in the k-th patch of the scene
% 0 otherwise
function res = isInterInPatch( inter, k, Points, Scene )
s = Scene(k, :);
a = Points(s(1),:);
b = Points(s(2),:);
c = Points(s(3),:);
Bu = [b-a; c-a];
p = coordsInBasis(inter, a, Bu);
if p(1)>=0 && p(2)>=0 && abs(p(1)+p(2))<=1
    res = 1;
else 
    res = 0;
end
