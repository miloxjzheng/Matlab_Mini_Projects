%Question 1:
%implement matMult in matMult.m
%Testing matMult:
%  A=[1,2,3;4,5,6];
%  B=[1,2,3;4,5,6];
%  matMult(A,B)
A=[1,2,3;4,5,6];
B=[1,2;3,4;5,6];
matMult(A,B)

%Question 2:
%implement testMatMult in testMatMult.m
m=4;
n=4;
p=1;
nbtests = 10;
res = testMatMult(m,n,p,nbtests)

%Question 3:
t1=[];
t2=[];
for m=10:200
    A = randi([-10,10],m,m);
    B = randi([-10,10],m,m);
    C=@() matMult(A,B);
    a1=timeit(C);
    D=@() A*B;
    a2=timeit(D);
    t1=[t1,a1];
    t2=[t2,a2];
end
x = 10:1:200;
plot(x, t1)
hold on
plot(x, t2)
legend('matMult','*')

