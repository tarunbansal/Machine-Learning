data = load("sevens.mat");
% Part a - Find lower dimensional of the digits
[U S V] = svd(data.d);
k = 25;
X = U(:,1:k);
size(X);

% Find ideal image and distributed count data using poisson distribution.
means = load("mean.mat");
mu = reshape(means.mu,28,28);
y = poissrnd(means.mu);
y_not = reshape(y,784,1);
figure
imagesc(y); colormap(gray)
figure
imagesc(means.mu); colormap(gray)
size(y_not);

% Model the natural parameter with a linear model XW
w_hat = glmfit(X,y_not,'poisson');
size(w_hat);
y_hat_poisson = glmval(w_hat,X,'log');
size(y_hat_poisson);
figure
imagesc(reshape(y_hat_poisson,28,28)); colormap(gray);

% Compare the estimated image with the gaussian solution.
w_hat_gaussian = glmfit(X,y_not,'normal');
size(w_hat_gaussian);
y_hat_gaussian = glmval(w_hat_gaussian,X,'identity');
size(y_hat_gaussian);
figure
imagesc(reshape(y_hat_gaussian,28,28)); colormap(gray);
