%Pruebas Problema 4

x_min=-1;
v_min=-1;
x_max=1;
v_max=1;
h_x=0.01;
h_v=0.01;

x_malla=x_min:h_x:x_max;
v_malla=v_min:h_v:v_max;

[X,V] = meshgrid(x_malla,v_malla);

u1=@(x,v) x.^2+v.^2;
u2=@(x,v) cos(x)+sin(v);

f1=@(u) V;
f2=@(u) u;

[F1,F2,l] = eval_malla(f1,f2,u2,X,V);