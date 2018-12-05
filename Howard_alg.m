function [V, u] =Howard_alg(V0, u0, f1, f2, params, tol)



% Definir la función-matriz A

A = spzeros((nx+1)*(nv+1), (nx+1)*(nv+1));

indices1 = zeros((nx+1)*(nv+1),2);
indices2 = zeros((nx+1)*(nv+1),2);
indices3 = zeros((nx+1)*(nv+1),2);
indices4 = zeros((nx+1)*(nv+1),2);
indices5 = zeros((nx+1)*(nv+1),2);




W = [];
nu = [];
W = [W, V0];
nu = [nu, u0];
dif = 1;
contador = 0;

while dif > tol
    W_k = W(end)
    W = [W, inv(A(nu(end)))*b]
    min_AW = fminsearch(@(t) A(t)*W(end))
    nu = [nu, min_AW]
    
    dif = norm(W(end) - W_k)
    contador = contador + 1
end

