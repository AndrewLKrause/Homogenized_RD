function F_PDE = F_Micro_PDE(U,N,NPn,Pn,Lap,u1n,u2n,v1n,v2n,f1,f2,g1,g2,D1u,D2u,D1v,D2v)
F = zeros(N,1); F(u1n) = f1(U(u1n),U(v1n)); 
F(u2n) = f2(U(u2n),U(v2n)); 

G = zeros(N,1); G(u1n) = g1(U(u1n),U(v1n)); 
G(u2n) = g2(U(u2n),U(v2n)); 

F_PDE = [F+D1u*Lap*U(1:N); G+D1v*Lap*U(N+1:2*N)];
end