load fisheriris
X = meas(:, 1:4);

%教師ありプロット
figure,gscatter(X(:,1), X(:,2), species, 'rgb', 'osd');
figure,gscatter(X(:,3), X(:,4), species, 'rgb', 'osd');

%教師あり学習（個別分析）
lda = fitcdiscr(X, species);
ldaClass = resubPredict(lda);

figure,gscatter(X(:,1), X(:,2), ldaClass, 'rgb', 'osd');
figure,gscatter(X(:,3), X(:,4), ldaClass, 'rgb', 'osd');