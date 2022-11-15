load carsmall.mat

tree = fitrtree([Weight, Horsepower], MPG, ...
    'PredictorNames', {'W', 'H'})

view(tree, 'Mode', 'graph');

pred_MPG = predict(tree, [3000 100; 4000 150; 4000 200])

