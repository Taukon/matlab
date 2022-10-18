load census1994

head(adultdata);

% x2乗検定
[idx, scores] = fscmrmr(adultdata, 'salary');


figure, bar(scores(idx));
xlabel('rank');
ylabel('score');
xticklabels(strrep(adultdata.Properties.VariableNames(idx), '_', '\_'))