load census1994

head(adultdata);

% x2乗検定
[idx, scores] = fscchi2(adultdata, 'salary');

idxInf = find(isinf(scores));

scores(idxInf) = max(scores(~isinf(scores)));

figure, bar(scores(idx));
xlabel('rank');
ylabel('score');
xticklabels(strrep(adultdata.Properties.VariableNames(idx), '_', '\_'))