% inputs:
%--------
% inter : the coordinates of a point in the standard basis
%       : inter lies in the plane of the patch
% i,j   : indexes of a pixel
% lens: the array [ c; xc; yc; zc]
% sens: the array [ f, w, h, rw, rh]; 
% output: 
%--------
% 1 if inter lies in the i,j-th ray
% 0 otherwise
function res = isInterInRay(inter, i,j, lens,sens ) 
p = coordsOfPixInStandard(i,j,lens,sens);
c = lens(1,:);
if coordsInBasis(inter, c, (p-c))>=0
    res = 1;
else
    res = 0;
end
