%% MATLAB CW - SN: 17052580
%% Task 3

% Generate a set of random coefficients for a polynomial:
a = double(rand(10, 1));

% Define the polynomial using the generated coefficients and the function
% given in the coursework specification:
f = @(x) quadratic_polynomial(a, x);
df = @(f, x)finite_difference_gradient(f, x);

% Generate a random starting point x0:
x0 = double(randi([1, 10], 3, 1));

% Minimise the function using gradient_descent and print the results (the
% minimum point x and the function gradients at the aforementioned point:
x_min = gradient_descent(f, x0, 0.001, 3000, 0.0001, df);

fprintf('x_min = [%f %f %f], with f(x_min) = %f\n', x_min, f(x_min));
fprintf('gradients at x_min: %f %f %f\n', df(f, x_min));

% We can tell the point x that we get is close to a minimum by noticing
% that the gradients at point x are close to 0.
% Unfortunately, the point x may be a local minimum as opposed to a global
% minimum due to mathematical limitations of the gradient descent method
% (gradient descent is not guaranteed to always reach a global minimum).