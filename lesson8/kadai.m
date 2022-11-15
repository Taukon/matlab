load carbig.mat
rng('default');
X = [Acceleration Cylinders Weight Displacement Horsepower Model_Year];
y = MPG;

n = length(y);
hpartition = cvpartition(n, 'HoldOut', 0.3);
idxTrain = training(hpartition);
XTrain = X(idxTrain,:);
yTrain = y(idxTrain);
idxTest = training(hpartition);
XTest = X(idxTest,:);
yTest = y(idxTest);

%Lasso回帰
[B, FitInfo] = lasso(XTrain, yTrain, 'Alpha', 1, 'CV', 10);
idxLambda1SE = FitInfo.Index1SE;
coef = B(:, idxLambda1SE)
coef0 = FitInfo.Intercept(idxLambda1SE)
yhat = XTest*coef + coef0;
error = sum((yTest-yhat).^2, 'omitnan')

%すべての特徴量を用いた重回帰
XTrain = [ones(size(yTrain)) XTrain];
XTest = [ones(size(yTest)) XTest];
b = regress(yTrain, XTrain);
yhat = XTest*b;
error = sum((yTest-yhat).^2, 'omitnan')