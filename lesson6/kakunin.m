load humanactivity
rng('default');

type = optimizableVariable('DiscrimType', ...
    {'linear', 'pseudolinear', 'quadratic', 'pseudoquadratic'}, 'Type', 'categorical');

prior = optimizableVariable('Prior', {'empirical', 'uniform', 'species'}, 'Type', 'categorical');

c = cvpartition(actid, 'KFold', 5);

fun = @(x)kfoldLoss(fitcknn(feat, actid, 'CVPartition', c, ...
    'DiscrimType', char(x.DiscrimType), 'Prior', char(x.Prior)));

results = bayesopt(fun, [type, prior]);
results.XAtMinObjective