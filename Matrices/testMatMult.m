% inputs: integers m,n,p, nbtests
% output: throw an error if a resut of matMult is incorrect
%         otherwise returns 1
function res = testMatMult(m,n,p,nbtests)
R=[];
for i=1:nbtests
    A = randi([-10,10],m,n);
    B = randi([10,10],n,p);
    ans1= matMult(A,B);
    ans2= A*B;
    if ans1==ans2
        R=[R,1];
    else
        R=[R,0];
    end
end
if ismember(0,R)
    error('Results do not coincide')
else
    res=1;
end    
end
