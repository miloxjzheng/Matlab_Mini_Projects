% inputs:
%--------
% i,j : indexes of a pixel
% lens: the array [ c; xc; yc; zc]
% sens: the array [ f, w, h, rw, rh];
% output: 
%--------
% the coordinates of the center of the (i,j)-th pixel 
% in the standard coordinate system
function coords = coordsOfPixInStandard(i,j,lens,sens)
c = lens(1,:);
xc = lens(2,:);
yc = lens(3,:);
zc = lens(4, :);
f = sens(1);
w = sens(2);
h = sens(3);
rw = sens(4);
rh = sens(5);
p = c+f*zc; %the coordinates of the center of sensor
coords = p + ((i-0.5)-rw*0.5)*(w/rw)*xc + ((j-0.5)-rh*0.5)*(h/rh)*yc;

end
