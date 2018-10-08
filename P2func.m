function xdot=func(t,x)
%Modificar el valor de u para los distintos controles
u=1;
xdot(1)=x(2);
xdot(2)=-3*x(1)+2*u;
xdot=xdot';