%part c
load fisheriris

kmax = 100;
T = 40;
totalerr = 0;
total_iter = 0;
for k = 1:kmax
    r1 = randperm(50);
    r2 = 50 + randperm(50);
    r3 = 100 + randperm(50);
    
    train1 = r1(1:T);
    train2 = r2(1:T);
    train3 = r3(1:T);

    test1 = r1(T+1: 50);
    test2 = r2(T+1: 50);
    test3 = r3(T+1: 50);

    X = [ meas(train1, 1:4); meas(train2, 1:4); meas(train3, 1:4)];
    y = [ -ones(T, 1); zeros(T, 1); ones(T, 1)];
    w_temp = zeros(4,1);
    % Find out the weights using an iterative algo (what_lw)
    % Also find out the number of iterations occured (tm)
    [what_lw, tm] = lw(X,w_temp,y);
    
    Xtest = [ meas(test1, 1:4); meas(test2, 1:4); meas(test3, 1:4)];
    ytest = [ -ones(10, 1); zeros(10, 1); ones(10, 1)];
        
    ytesthat = round(Xtest*what_lw);
    misclassified = (nnz(ytest - ytesthat));
    
    %Average classification error
    err = misclassified / 30;
    totalerr = totalerr + err;
    total_iter = total_iter + tm;
end

%Average of all classification errors
totalerr
avg_of_all_classification_errors = totalerr / kmax;
avg_of_all_classification_errors
total_iter
avg_iter = round(total_iter / kmax);
avg_iter
function [Z,tm] = lw(X,W,Y);
s = 0.0002;
iterations = 10000;
tol = 0.0001;
Z = W;
for ii = 1:100000,
    w_new = W + s*X'*(Y-X*W);
    if norm(w_new - W) < tol,
        break
    end
    W = w_new;
end
tm = ii;
Z = W;
end

