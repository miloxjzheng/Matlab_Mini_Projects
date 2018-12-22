%Specifying the lens: 4 vectors
%lens(1,:)=c (the position of the lens)
%lens(2,:)=x_c 
%lens(3,:)=y_c 
%lens(4,:)=z_c the optical axis
lens=[ -2,0,0 ; 0,-1,0; 0,0,1; 1,0,0 ];
% focal length:
f=3;
% size of the screen: w: wideth, h: height
w=2;
h=2;
% resolution of the screen:
rw=60;
rh=60;
% sensor:
sens=[ f, w,h, rw,rh ];

%3D scene: a tetrahedron
Points= [2,0.1,0.1;          %p1
         3,-0.1,0.05;        %p2
         2.55, 0.9, -0.05;   %p3
         3.4,0.6,0.66 ];     %p4
         
Scene = [ 1,2,3;   % triangular patch with vertices p1,p2,p3
          2,3,4;   % triangular patch with vertices p2,p3,p4
          3,1,4;   % triangular patch with vertices p3,p1,p4
          1,2,4 ]; % triangular patch with vertices p1,p2,p4
          
Colors = [ 0,1,1;   %cyan    : color of the first patch
           0,0,1;   %blue    : color of the second patch
           1,0,1;   %magenta : color of the third patch
           1,1,0 ]; %yellow  : color of the fourth patch

% plot the scene 
figure(1);
patch('Vertices',Points,'Faces',Scene,'FaceVertexCData',Colors,'FaceColor','flat');
view(3);
% plot the model in the same figure
hold on
drawModel(lens,sens);
hold off
axis([-4 4 -4 4 -4 4])

%compute the 2D image
image = computeImage(lens, sens, Points, Scene, Colors);
%plot the 2D image
figure(2);
drawImage(image, lens, sens);

%definition of local functions
function image = computeImage(lens, sens, Points, Scene, Colors)

    sS = size(Scene);
    image = ones(sens(4)*sens(5),3);
    %for each pixel of the sensor
    for i=1:sens(4)
        for j=1:sens(5)
            
            mindepth = +Inf;
            goodColor = [1,1,1]; %white
            
            %for each patch of the scene
            for k=1:sS(1)
                depth = intersectRayPatch(i,j,k,lens,sens, Points, Scene);
                if depth < mindepth
                    mindepth = depth;
                    goodColor = Colors(k,:);
                end
            end
            
            %index of the i,j-th pixel in image:
            curIndex = (j-1)*sens(4) + i;
            image(curIndex,:)=goodColor;
        end
    end
end

function drawImage(image, lens, sens)
    patches = [];
    s=size(image);
    for k=1:s(1)
        %index i,j of the corresponding pixel
        j=floor( (k-1)/sens(4))+1;
        i=mod( (k-1), sens(4) )+1;
        patches = [patches;drawpixel_inImage(i,j,image(k,:),lens,sens)];
    end
    view(2);
end

function p = drawpixel_inImage(i,j,color,lens,sens)
    coords = coordsPixel_inImage(i,j, lens, sens);
    %vertices of the pixel
    vert = [ coords - ((1/2)*widthPixWidth(sens))*[1,0] - ((1/2)*widthPixHeigth(sens))*[0,1] ;
             coords - ((1/2)*widthPixWidth(sens))*[1,0] + ((1/2)*widthPixHeigth(sens))*[0,1] ;
             coords + ((1/2)*widthPixWidth(sens))*[1,0] + ((1/2)*widthPixHeigth(sens))*[0,1] ;
             coords + ((1/2)*widthPixWidth(sens))*[1,0] - ((1/2)*widthPixHeigth(sens))*[0,1]  ];
    face = [1,2,3,4];
    p = patch('Vertices',vert,'Faces',face,'FaceVertexCData',[color],'FaceColor','flat');
end

function drawModel(lens, sens)
    plot3(lens(1,1),lens(1,2),lens(1,3),"b.","markers",12)

    quiver3(lens(1,1),lens(1,2),lens(1,3), lens(2,1),lens(2,2),lens(2,3),0,'b','LineWidth',2);
    quiver3(lens(1,1),lens(1,2),lens(1,3), lens(3,1),lens(3,2),lens(3,3),0,'b','LineWidth',2);
    quiver3(lens(1,1),lens(1,2),lens(1,3), lens(4,1),lens(4,2),lens(4,3),0,'b','LineWidth',2);

    for i=1:sens(4)
        for j=1:sens(5)
            coords = coordsOfPixInStandard(i,j, lens, sens);
            plot3(coords(1),coords(2),coords(3),'k.','markers',6)
        end
    end
end

function coords = coordsPixel_inImage(i,j, lens, sens)
    coords = zeros(1,2);
    coords(1) = (1/2)*( - sens(2) + (2*i-1)*widthPixWidth(sens) );
    coords(2) = (1/2)*( - sens(3) + (2*j-1)*widthPixHeigth(sens) );
end

function ww = widthPixWidth(sens)
    ww = sens(2)/sens(4);
end

function wh = widthPixHeigth(sens)
    wh = sens(3)/sens(5);
end
