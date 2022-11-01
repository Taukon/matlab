load fisheriris.mat

rng('default');

num =optimizableVariable('k', [1, 10], 'Type', 'integer');
dst = optimizableVariable('dst', {'chebychev', 'euclidean', 'minkowski'}, ...
    'Type', 'categorical');

c = cvpartition(species, 'KFold', 5);

fun = @(x)kfoldLoss(fitcknn(meas, species, 'CVPartition', c, ...
    'NumNeighbors', x.k, 'Distance', char(x.dst)));

results = bayesopt(fun, [num, dst]);

results.XAtMinObjective