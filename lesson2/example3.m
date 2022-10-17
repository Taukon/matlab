load fisheriris
X = meas(:, 1:4);

figure,gscatter(X(:,1), X(:,2), species, 'rgb', 'osd');
xlabel('Sepal length');
ylabel('Sepal width');

%ニューラルネットワークによる分類
rng("default");
Mdl = fitcnet(meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, meas(:,1:2), species, "LossFun", "classiferror")

%0～1スケーリング
norm_meas = normalize(meas, 1, 'range', [0 1]);
Mdl = fitcnet(norm_meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, norm_meas(:,1:2), species, "LossFun", "classiferror")

%-1～1スケーリング
norm_meas = normalize(meas, 1, 'range', [-1 1]);
Mdl = fitcnet(norm_meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, norm_meas(:,1:2), species, "LossFun", "classiferror")

%z-scoreスケーリング
norm_meas = normalize(meas, 1, 'zscore');
Mdl = fitcnet(norm_meas(:,1:2), species, "IterationLimit", 10);
testError = loss(Mdl, norm_meas(:,1:2), species, "LossFun", "classiferror")
