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

[B, FitInfo] = lasso(XTrain, yTrain, 'Alpha', 0.01, 'CV', 10);
idxLambda1SE = FitInfo.Index1SE;
coe = B(:, idxLambda1SE)
coef0 = FitInfo.Intercept(idxLambda1SE)

yhat = XTest*coe + coef0;
hold on;
scatter(yTest, yhat);
plot(yTest, yTest);
xlabel('Actual MPG');
ylabel('Predicted MPG');
hold off;