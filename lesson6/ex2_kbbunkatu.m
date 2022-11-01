load fisheriris.mat

rng('default');

n= length(species);

c = cvpartition(n, 'KFold', 2);
lda = fitcdiscr(meas, species, 'CVPartition', c);
predictedSpecies = kfoldPredict(lda);
confusionchart(species, predictedSpecies);

c = cvpartition(n, 'LeaveOut');
lda = fitcdiscr(meas, species, 'CVPartition', c);
predictedSpecies = kfoldPredict(lda);
confusionchart(species, predictedSpecies);