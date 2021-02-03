%% MATLAB CW - SN: 17052580
%% Task 2.1
%%

% The Gaussian pdf function as described in the coursework specification:
function p = gaussian_pdf(x, u, S)
    p = (1/((2 * pi)^(3 / 2) * sqrt(det(S)))) * exp((-1 / 2) .* ...
    ((x - u).') * inv(S) * (x - u));
end