load census.mat

%線警戒機モデル
mdl = fitlm(cdate, pop)
plot(mdl)
title('U.S. population from 1790 to 1990');
xlabel('Census Year');
ylabel('Population (millions)');