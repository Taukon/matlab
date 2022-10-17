load fisheriris

%主成分分析
[coeff, score, latent] = pca(meas);

%第１主成分、第２主成分の係数
coeff(:,1)
coeff(:,2)

%累積寄与率の表示
CR = cumsum(latent)/sum(latent);

%教師あり学習
lda = fitcdiscr(score(:,1:2),species);
ldaClass = resubPredict(lda);
figure,gscatter(meas(:,1), meas(:,2), ldaClass, 'rgb', 'osd');