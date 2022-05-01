parameters;
Setup_Microscale_Model;


% Solve the PDE - optional could add: 'reltol',1e-9,'AbsTol',1e-9,
opts = odeset('JPattern',JPattern);
[~, U] = ode15s(F_PDE,tspan,uv_init,opts);

UM = U(:,1:N);