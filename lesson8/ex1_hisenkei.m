load census.mat

figure, plot(cdate, pop, 'ro');
xlabel('census year');
ylabel('population');

hold on;
[f, out] = fit(cdate, pop, 'poly2')
disp(out, rsquare);
plot(f, 'b-');

[f, out] = fit(cdate, pop, 'poly7')
disp(out, rsquare);
plot(f, 'r-');

[f, out] = fit(cdate, pop, 'exp1')
disp(out, rsquare);
plot(f, 'g-');

hold off;