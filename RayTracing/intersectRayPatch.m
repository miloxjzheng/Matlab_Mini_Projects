% inputs:
%--------
% i,j   : indexes of a pixel
% k     : the index of a patch
% lens  : the array [ c; xc; yc; zc]
% sens  : the array [ f, w, h, rw, rh]; 
% Points: the v*3 array containing the matrices of the scene
% Scene : the m*3 array which k-th row contains the 
%         indexes in Points of the vertices of the k-th patch
% output: 
%--------
function depth  = intersectRayPatch(i,j,k,lens,sens, Points, Scene)
[A1, w1] = systOfEqnsOfRay(i,j, lens,sens);
[A2, w2] = systOfEqnsOfPatch(k, Points, Scene);
c = lens(1,:);
A = zeros(3, 3);
w = zeros(3, 1);
A(1:2, :) = A1;
A(3, :) = A2;
w(1:2) = w1;
w(3) = w2;
p = A\w;
p = p';
if isInterInRay( p, i,j, lens,sens )==0
    depth = +Inf;
elseif isInterInPatch( p, k, Points, Scene )==0
    depth = +Inf;
else
    depth = norm(p-c);
end
