% inputs:
%--------
% a: a point of R^3 given in the standard coordinate system
% u: a point of R^3 given in the standard coordinate system
% Bu: a m*3 array; 
% for any i, B(i,:) is a vector of R^3 given in the standard coordinate system
% u, B(1,:),...,B(m,:) is a coordinate system 
% of the affine subspace U of R^3
% output: 
%--------
% the coordinates of a in u, B(1,:),...,B(m,:)
function coords = coordsInBasis(a, u, Bu)
s = a - u;
M = Bu';
result = M\(s');
coords = result';
end 
