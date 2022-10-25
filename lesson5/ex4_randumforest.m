load carbig

Cylinders = categorical(Cylinders);
Model_Year = categorical(Model_Year);
Origin = categorical(cellstr(Origin));

X = table(Cylinders, Displacement, Horsepower, Weight, Acceleration, Model_Year, Origin);

t = templateTree('NumVariablesToSample', 'all', ...
    'PredictorSelection', 'interaction-curvature', ...
    'Surrogate', 'on');

rng('default');

Mdl = fitrensemble(X, MPG, 'Method', 'Bag', 'NumLearningCycles', 200, 'Learners', t);
impOOB = oobPermutedPredictorImportance(Mdl);

figure, bar(impOOB)
xlabel('Predictor Variable');
ylabel('Importance');
h = gca;
h.XTickLabel = Mdl.PredictorNames;