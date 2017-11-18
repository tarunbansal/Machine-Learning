%part c
load fisheriris

kmax = 100;

T = 49;
totalerr = 0;
total_iter = 0;
for k = 1:T
    r1 = randperm(50);
    r2 = 50 + randperm(50);
    r3 = 100 + randperm(50);
    
    train1 = r1(1:k);
    train2 = r2(1:k);
    train3 = r3(1:k);

    test1 = r1(k+1: 50);
    test2 = r2(k+1: 50);
    test3 = r3(k+1: 50);

    X = [ meas(train1, 1:4); meas(train2, 1:4); meas(train3, 1:4)];
    y = [ -ones(k, 1); zeros(k, 1); ones(k, 1)];
    w_temp = zeros(4,1);
    % Find out the weights using an iterative algo (what_lw)
    % Also find out the number of iterations occured (tm)
    [what, tm] = sgd(X,w_temp,y);
   
    Xtest = [ meas(test1, 1:4); meas(test2, 1:4); meas(test3, 1:4)];
    ytest = [ -ones(50-k, 1); zeros(50-k, 1); ones(50-k, 1)];
        
    ytesthat = round(Xtest*what);
    misclassified = (nnz(ytest - ytesthat));
    
    %Average classification error
    err = misclassified / 3*(50-k);
    err_size(k) = err;
    totalerr = totalerr + err;
    total_iter = total_iter + tm;
end

%Average of all classification errors
totalerr
avg_of_all_classification_errors = totalerr / 49;
avg_of_all_classification_errors

plot(err_size)

function [Z,tm] = sgd(X,W,Y);
s = 0.0002;
iterations = 10000;
tol = 0.0001;
w_new = W;
for ii = 1:100000,
    if (mod(ii,100) == 0) && (ii ~= 0),
        if norm(w_new - W) < tol,
            break;
        end
        w_new = W;
    end
    sz = size(X,1) - 1;
    temp = 1 + floor(rand(1)*sz);
    x_index = X(temp,:);
    y_index = Y(temp,:);
    W = W + s*(((y_index - x_index*W)*x_index)');
end
tm = ii;
Z = W;
end

