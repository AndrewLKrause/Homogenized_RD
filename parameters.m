% Geometric Parameters
theta = 0.5; % Ratio of patch lengths
Pn = 1; % Number of patches of each kind (so 2*Pn total patches)
eta = 1e9; % Coupling constant between patches
L = 60; % Length of macroscale domain
pL = L/(2*Pn); % Length of individual patch

% Mesh size parameters
N = 1000; % Total number of grid points to use
dx = L/(N-1); % Spacing between grid points

% Time scale for simulation
T = 3000; 
tspan = linspace(0,T,1e2); % Interpolate solution on [0,T] with 1e2 points

% Kinetic/ratio of diffusion parameters
a1 = 0.01;
a2 = 0.1;
b1 = .9;
b2 = 9;
D1 = 100;
D2 = 500;

% Kinetics
f1 = @(u,v)a1-u+u.^2.*v;
f2 = @(u,v)a2-u+u.^2.*v;
g1 = @(u,v)b1-u.^2.*v;
g2 = @(u,v)b2-u.^2.*v;

% Steady states
u1ss = a1+b1;
v1ss = b1/(a1+b1)^2;
u2ss = a2+b2;
v2ss = b2/(a2+b2)^2;

% Create a normally distributed vector of size N, mean 1, stdev 1e-2.
rng(1);
rand_vec = 1+1e-2*randn(2*N,1); 
% TODO: implement initialization of patch concentrations

