load carbig.mat
rng('default');
X = [Weight Horsepower];
y = MPG;

R = rmmissing([X, y]);
X = R(:,1:2);
y = R(:,3);
Z = zscore(X);

Mdl = fitrlinear(Z, y, 'KFold', 5)
kfoldLoss(Mdl, 'mode', 'individual')

Mdl = fitrkernel(Z, y, 'KFold', 5)
kfoldLoss(Mdl, 'mode', 'individual')