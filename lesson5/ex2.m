load fisheriris.mat

figure, scatter(meas(:,1), meas(:,2), 15, categorical(species), 'filled');
figure, scatter(meas(:,3), meas(:,4), 15, categorical(species), 'filled');

Y2 = tsne(meas, 'NumDimensions', 2);
figure, scatter(Y2(:,1), Y2(:,2), 15, categorical(species), 'filled');

Y3 = tsne(meas, 'NumDimensions', 3);
figure, scatter3(Y3(:,1), Y3(:,2), Y3(:,3), 15, categorical(species), 'filled');