%% MATLAB CW - SN: 17052580
%% Task 3.2

% This function minimizises an input function f using the gradient descent
% method. The function stops after N iterations or when differences between
% steps become smaller than a tolerance value tol.

function res = gradient_descent(f, x0, lr, N, tol, df)
    diff = 0;
    n = numel(x0);
    res = x0;
    while N > 0
        old = res;
        pds = df(f, res);
        for i = 1:n
            if pds(i) < 0
                res(i) = res(i) + lr * pds(i);
            elseif pds(i) > 0
                res(i) = res(i) - lr * pds(i);
            end
        end
        diff = abs(f(res) - f(old));
        if diff < tol
            break;
        end
        N = N - 1;
    end
end