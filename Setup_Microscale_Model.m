% Index labels
u1n = []; u2n=[];
for i=0:Pn-1
    u1n = [u1n,2*i*NPn+(1:NPn)]; u2n = [u2n, 2*i*NPn+(NPn+1:2*NPn)];
    v1n = u1n+N; v2n = u2n+N;
end

% Initial conditions
uv_init = zeros(2*N,1);
uv_init(u1n) = u1ss*rand_vec(u1n);uv_init(u2n) = u2ss*rand_vec(u2n);
uv_init(v1n) = v1ss*rand_vec(v1n);uv_init(v2n) = v2ss*rand_vec(v2n);

% BELOW CODE ONLY WORKS FOR Du1=Du2, Dv1=Dv2!

% Form the Laplacian
e = ones(N,1); % Vector of ones to use across the diagonals
Lap= spdiags([e -2*e e], -1:1, N, N); % Diagonal Laplacian
Lap(1,1) = -1; Lap(N,N) = -1; % Neumann boundary conditions
Lap = Lap./dx^2; % Scale the finite-difference operator

% The right-hand-side of our discretized ODE system
F_PDE = @(t,U)F_Micro_PDE(U,N,NPn,Pn,Lap,u1n,u2n,v1n,v2n,f1,f2,g1,g2,D1u,D2u,D1v,D2v);




% Set up the Jacobian sparsity pattern - important for speed!
Id = eye(N);
JPattern = sparse([Lap, Id; Id, Lap]);