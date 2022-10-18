load fisheriris

rng('default');

X = randn(150,10);
X(:,[1 3 5 7]) = meas;
y = species;

c = cvpartition(y, 'k', 10);

fun = @(XT, yT, Xt, yt)(loss(fitcecoc(XT, yT), Xt, yt));

opts = statset('Display', 'iter');
[fs, history] = sequentialfs(fun, X, y, 'cv', c, 'options', opts);

disp(history.In);