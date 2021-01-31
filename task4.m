%% MATLAB CW - SN: 17052580
%% Task 4

% Read an example triangulation surface mesh from the provided files:
verts = readmatrix('data/example_vertices.csv');
tris = readmatrix('data/example_triangles.csv');

% Perform the smoothing using 5, 10 and 25 iterations:
sm5 = lowpass_mesh_smoothing(verts, tris, 5);
sm10 = lowpass_mesh_smoothing(verts, tris, 10);
sm25 = lowpass_mesh_smoothing(verts, tris, 25);

% Plot the original surface and the three smoothed surfaces and save the
% figues as png files:
figure, trisurf(tris, verts(:, 1), verts(:, 2), verts(:, 3));
saveas(gcf, 'figure4_1.png');
figure, trisurf(tris, sm5(:, 1), sm5(:, 2), sm5(:, 3));
saveas(gcf, 'figure4_2.png');
figure, trisurf(tris, sm10(:, 1), sm10(:, 2), sm10(:, 3));
saveas(gcf, 'figure4_3.png');
figure, trisurf(tris, sm25(:, 1), sm25(:, 2), sm25(:, 3));
saveas(gcf, 'figure4_4.png');