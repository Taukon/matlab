load fisheriris.mat

rng('default');

n = length(species);
hpartition = cvpartition(n, 'HoldOut', 0.3);

idxTrain = training(hpartition);
measTrain = meas(idxTrain, :);
speciesTrain = species(idxTrain);

idxTest = test(hpartition);
measTest = meas(idxTest, :);
speciesTest = species(idxTest);

Ida = fitcdiscr(measTrain, speciesTrain);
predictedSpecies = predict(Ida, measTest);

confusionchart(speciesTest, predictedSpecies);