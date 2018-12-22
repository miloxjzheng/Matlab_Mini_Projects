% inputs:
%--------
% Points: the v*3 array containing the matrices of the scene
% Scene : the m*3 array which k-th row contains the 
%         indexes in Points of the vertices of the k-th patch
% k     : an integer >= 1 and <=m    
% output: 
%--------
% the implicit representation of the plane containing the k-th patch:
% A : an 1*3 matrix
% w : a 1*1 vector
% s.t the points of the plane containing the k-th patch are the solutions 
% of Av=w
function [A,w] = systOfEqnsOfPatch(k, Points, Scene)
    s = Scene(k, :);
    a = Points(s(1),:);
    b = Points(s(2),:);
    c = Points(s(3),:);
    v = cross(b-a, c-a);
    v = v/norm(v);
    A = v;
    w = A*a';
end
