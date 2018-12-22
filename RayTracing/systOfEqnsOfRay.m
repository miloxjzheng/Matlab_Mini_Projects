% inputs:
%--------
% i,j : indexes of a pixel
% lens: the array [ c; xc; yc; zc]
% sens: the array [ f, w, h, rw, rh];  
% output: 
%--------
% the implicit representation of the line (c,pix(i,j)):
% A : an 2*3 matrix
% w : a 2*1 vector
% s.t the points of the (c,pix(i,j)) are the solutions 
% of Av=w
function [A, w] = systOfEqnsOfRay(i,j, lens,sens)
p = coordsOfPixInStandard(i,j,lens,sens);
c = lens(1,:);
xc = lens(2,:);
yc = lens(3,:);
Bu = [p-c; xc; yc];
Cu = zeros(3,3);
Cu(1,:) = Bu(1, :);
for i = 2:3
    bi = Bu(i,:);
    a = 0;
    for q = 1:i-1
        a = a + dot(Bu(i, :),Cu(q,:))/dot(Cu(q,:),Cu(q,:))*Cu(q,:);
    end
    Cu(i,:) = bi - a;
end
A = [Cu(2, :); Cu(3, :)];
w = A*(c');    
end
