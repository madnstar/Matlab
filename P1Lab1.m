clear all;
clc;

%condiciones iniciales
dz0=[1 2];

%Intervalo sobre el cual solucionar
int=[0 2];

%Resolver la EDO num�ricamente
[t,z] = ode45('P1func', int, dz0);

figure();
plot(t,z(:,1));
title('Din�mica de x');
xlabel('t');
ylabel('x')

figure();
plot(t,z(:,2));
title('Din�mica de y');
xlabel('t');
ylabel('y')