load carbig.mat
rng('default');

%x = [Weight, Horsepower];
%x = [Weight, Cylinders];
%x = [Weight, Acceleration];
x = [Weight, Model_Year];
y = MPG;

%線形回帰モデルの生成
mdl = fitlm(x, y)

%可視化
scatter3(Weight, Model_Year, y, 'ro', 'filled')%%
hold on
x1fit = min(Weight):100:max(Weight);
x2fit = min(Model_Year):1:max(Model_Year);%%
[X1FIT X2FIT] = meshgrid(x1fit,x2fit);
YFIT = mdl.Coefficients.Estimate(1) + ...
    mdl.Coefficients.Estimate(2)*X1FIT + ...
    mdl.Coefficients.Estimate(3)*X2FIT;

mesh(X1FIT, X2FIT, YFIT)
xlabel('Weight');
ylabel('Model_Year');
zlabel('MPG');
view(50, 10);
hold off