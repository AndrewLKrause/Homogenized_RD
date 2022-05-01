% Homogenized kinetics & Diffusion
fH = @(u,v)theta*f1(u,v)+(1-theta)*f2(u,v);
gH = @(u,v)theta*g1(u,v)+(1-theta)*g2(u,v);
DH = 1/(theta/D1+(1-theta)/D2+2/eta);

% Form the Laplacian
e = ones(N,1); % Vector of ones to use across the diagonals
Lap= spdiags([e -2*e e], -1:1, N, N); % Diagonal Laplacian
Lap(1,1) = -1; Lap(N,N) = -1; % Neumann boundary conditions
Lap = Lap./dx^2; % Scale the finite-difference operator

% Index labels
uN = 1:N; vN = N+1:2*N;

% Steady states
uH = theta*u1ss+(1-theta)*u2ss; % I do not think this works in general!
vH = theta*v1ss+(1-theta)*v2ss; % I do not think this works in general!

% Set up the Jacobian sparsity pattern - important for speed!
Id = eye(N);
JPattern = sparse([Lap, Id; Id, Lap]);