%% MATLAB CW - SN: 17052580
%% Task 4.1

% This function performs mesh smoothing on a given surface mesh using the
% method described in Bade et al., 2006.

% Parameters N, lam (lambda) and mu take default values 10, 0.9, -1.02*lam,
% respectively, if no values are provided.

function res = lowpass_mesh_smoothing(verts, tris, N, lam, mu)
    res = verts;
    reso = verts;
    if nargin < 3
        N = 10;
        lam = 0.9;
        mu = -1.02 * lam;
    elseif nargin < 4
        lam = 0.9;
        mu = -1.02 * lam;
    elseif nargin < 5
        mu = -1.02 * lam;
    end
    vnum = size(verts);
    vnum = vnum(1);
    tnum = size(tris);
    tnum = tnum(1);
    
    % Construct an adjacency matrix that will be used to determine the
    % neighbours of each point:
    adj = zeros(vnum);
    for i = 1:tnum
        adj(tris(i, 1), tris(i, 2)) = 1;
        adj(tris(i, 1), tris(i, 3)) = 1;
        adj(tris(i, 2), tris(i, 3)) = 1;
        adj(tris(i, 2), tris(i, 1)) = 1;
        adj(tris(i, 3), tris(i, 1)) = 1;
        adj(tris(i, 3), tris(i, 2)) = 1;
    end
    g = graph(adj);
    
    % The following lines perform the mesh smoothing according to Bade et
    % al., 2006:
    for i = 1:N
        for v = 1:vnum
            sum = 0;
            ngh = neighbors(g, v);
            omega = 1 / numel(ngh);
            for j = 1:numel(ngh)
                sum = sum + omega * (reso(ngh(j), :) - reso(v, :));
            end
            res(v, :) = reso(v, :) + lam * sum;
        end
        reso = res;
        
        for v = 1:vnum
            sum = 0;
            ngh = neighbors(g, v);
            omega = 1 / numel(ngh);
            for j = 1:numel(ngh)
                sum = sum + omega * (reso(ngh(j), :) - reso(v, :));
            end
            res(v, :) = reso(v, :) + mu * sum;
        end
        reso = res;
    end
end