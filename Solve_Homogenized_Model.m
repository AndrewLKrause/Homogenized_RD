parameters;
Setup_Homogenized_Model;
% Initial conditions for ODE system
uvH_init = [uH*rand_vec(uN);vH*rand_vec(vN)];

% The right-hand-side of our discretized ODE system
FH_PDE = @(t, U)[fH(U(uN),U(vN))+DHu*Lap*U(uN);gH(U(uN),U(vN))+DHv*Lap*U(vN)];

% Solve the PDE - optional could add: 'reltol',1e-9,'AbsTol',1e-9,
opts = odeset('JPattern',JPattern);
[~, U] = ode15s(FH_PDE,tspan,uvH_init,opts);

UH = U(:,1:N);