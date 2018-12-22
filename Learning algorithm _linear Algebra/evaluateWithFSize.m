function res = evaluateWithFSize (evaluatingSet, learningSet)
[a, ~] = size(evaluatingSet);
A = 0;
T = 0;
for i = 1:a
    g = decideWithFSize (evaluatingSet(i, 3), learningSet);
    A = A+1;
    if g == evaluatingSet(i, 1)
        T = T+1;
    end 
end
res = T/A;
end