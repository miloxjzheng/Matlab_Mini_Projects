% inputs: A,B: two matrices
% output: the product A*B
function res = matMult(A,B)
C= zeros(size(A,1), size(B,2));
if size(A,2)==size(B,1)
    for i=1:size(A,1)
        for j=1:size(B,2)
            C(i,j)=dot(A(i,:),B(:,j));
        end
    end
res=C;
else
    error('Matrices in input do not have the appropriated size.')    
end  
