function [F1,F2,l] = eval_malla(f1,f2,u,X,V)
%eval_malla Dados funciones f1(u),f2(u),u(x,v), la malla en el eje x
%x_malla y la malla en el eje v v_malla retorna la evaluacion de f1 y f2 en
%la malla

u_=u(X,V);
F1=f1(u_);
F2=f2(u_);
s=size(X);
l=ones(s(1),s(2));

%Graficamos
figure(1)
mesh(X,V,F1)
figure(2)
mesh(X,V,F2)

%Diagramas de fase
figure(3)
quiver(X,V,F1,F2)




end

