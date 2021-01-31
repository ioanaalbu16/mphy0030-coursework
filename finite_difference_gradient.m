%% MATLAB CW - SN: 17052580
%% Task 3.1

% This function computes the approximate partial derivatives for each 
% variable of a multivariate function at a certain point x (the gradients
% of the function with respect to each axis).

function res = finite_difference_gradient(f, x)
    h = 0.0001;
    res = [];
    n = numel(x);
    for i = 1:n
        xi = x;
        xi(i) = x(i) + h;
        res = [res, (f(xi) - f(x)) / h];
    end
end