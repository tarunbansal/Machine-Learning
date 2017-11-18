 ../load fisheriris

% Set different cross validation params
cmax = 100;
T = 40;
totalerr = 0;
for c = 1:cmax
    r1 = randperm(50);
    r2 = 50 + randperm(50);
    r3 = 100 + randperm(50);
    
    % Fit the model using each type of label in the training data.
    train1 = r1(1:T);
    train2 = r2(1:T);
    train3 = r3(1:T);
    test1 = r1(T+1: 50);
    test2 = r2(T+1: 50);
    test3 = r3(T+1: 50);
    
    % Find the covariance, inverse and mean matrix for each label type
    ss = cov(meas(train1, 1:4));
    vv = cov(meas(train2, 1:4));
    ww = cov(meas(train3, 1:4));

    iS = inv(ss);
    iV = inv(vv);
    iW = inv(ww);

    mean1 = mean(meas(train1, 1:4))';
    mean2 = mean(meas(train2, 1:4))';
    mean3 = mean(meas(train3, 1:4))';
    
    % Create the test vector using left out indices
    X = [ meas(test1, 1:4); meas(test2, 1:4); meas(test3, 1:4)];
    y = [ ones(10, 1); ones(10, 1) * 2; ones(10, 1) * 3];

    
    for k = 1:30
        x = X(k,1:4);
        
        % Get the Probability density function for each label type using 
        % the inverse covariance matrix for each label type.
        p1=exp(-(x'-mean1)'*iS*(x'-mean1));

        p2=exp(-(x'-mean2)'*iV*(x'-mean2));

        p3=exp(-(x'-mean3)'*iW*(x'-mean3));
        
        % Classifier returns the maximum pdf label as the output for test 
        % vector.
        [argvalue, argmax] = max([p1, p2, p3]);
        
        y_predicted(k) = argmax;
    end
    
    error = nnz(y - y_predicted');
    totalerr = totalerr + error;
end

totalerr/cmax
 
    

    







