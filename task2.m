%% MATLAB CW - SN: 17052580
%% Task 2

% Take a normal distribution of 10,000 column vectors x:
x = random('Normal', 0, 1, 10000, 3);

% Calculate the respective mean and covariance:
m = mean(x).';
C = cov(x);

% Compute the probability density for each value in x using the
% gaussian_pdf function:
pds = [];
for i = 1:10000
    pds = [pds, gaussian_pdf(x(i, :).', m, C)];
end
% Calculate the 10th, 50th, 90th percentile:
tenth = prctile(pds, 10);
fiftieth = prctile(pds, 50);
ninetieth = prctile(pds, 90);

% Choose a small tolerance value for determining which points have a
% certain probability density:
tol = 0.0005;

% For the 10th, 50th and 90th percentiles probability densities, get all
% the points with that probability density:
x10 = [];
x50 = [];
x90 = [];

for i = 1:10000
    if abs(gaussian_pdf(x(i, :).', m, C) - tenth) <= tol
        x10 = [x10, x(i, :).'];
    elseif abs(gaussian_pdf(x(i, :).', m, C) - fiftieth) <= tol
        x50 = [x50, x(i, :).'];
    elseif abs(gaussian_pdf(x(i, :).', m, C) - ninetieth) <= tol
        x90 = [x90, x(i, :).'];
    end
end

% For each point set, plot the ellipsoid surface and save the figures as
% png files;
% For plotting the surfaces, delaunay triangulation was used:
dt10 = delaunay(x10(1, :), x10(2, :), x10(3, :));
dt50 = delaunay(x50(1, :), x50(2, :), x50(3, :));
dt90 = delaunay(x90(1, :), x90(2, :), x90(3, :));

figure, trisurf(dt10, x10(1, :), x10(2, :), x10(3, :));
saveas(gcf, 'figure2_1.png');
figure, trisurf(dt50, x50(1, :), x50(2, :), x50(3, :));
saveas(gcf, 'figure2_2.png');
figure, trisurf(dt90, x90(1, :), x90(2, :), x90(3, :));
saveas(gcf, 'figure2_3.png');
