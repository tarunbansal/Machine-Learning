data = load("face_emotion_data.mat");
X = data.X;
y = data.y;
for k=1:128
    if y(k) == 1
        y_n(k) = 1;Use the training data X and y to design a classifier using logistic regression (you can use glmfit in Matlab or another software package) to compute the MLE of classifier weights w.
    else
        y_n(k) = 0;
    end
end

% y
size(X)

% Part e - Perform cross validation
for k=1:8
    ih = [16*k-15:16*k];   % the set of hold-out indices
    it = setdiff(1:128,ih);
    X_in = X(it,:);
    X_h = X(ih,:);
    y_in = y_n(it);
    y_h = y_n(ih);
    % We can use the w_hat to classify any new image as happy or not
    % Use w_hat * (input_image) to generate a label
    % If label > 0.5 Classify as happy, otherwise sad.
    w_hat = glmfit(X_in,y_in','binomial');
    y_hat = glmval(w_hat,X_h,'logit');
    for p=1:16
        if y_hat(p) >= 0.5
            y_hat(p) = 1;
        else
            y_hat(p) = 0;
        end
    end
    er(k) = (nnz(y_hat' - y_h));
end

% Part e- Error rate
average_error_rate = mean(er)

% Part d - We can select any 3 feature with possitive wights. Magnitude
% doesnt matter. Selecting features 1,2,3 and then repeat the above process

for k=1:8
    ih = [16*k-15:16*k];   % the set of hold-out indices
    it = setdiff(1:128,ih);
    X_in = X(it,1:3);
    X_h = X(ih,1:3);
    y_in = y_n(it);
    y_h = y_n(ih);
    w_hat = glmfit(X_in,y_in','binomial');
    y_hat = glmval(w_hat,X_h,'logit');
    for p=1:16
        if y_hat(p) >= 0.5
            y_hat(p) = 1;
        else
            y_hat(p) = 0;
        end
    end
    err_restricted(k) = (nnz(y_hat' - y_h));
end

average_res_err_rate = mean(err_restricted)