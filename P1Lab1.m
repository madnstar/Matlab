clear all;
clc;

dz0=[1 2];

int=[0 2];

[t,z] = ode45('P1func', int, dz0);

figure();
plot(t,z(:,1));
title('Dinámica de x');
xlabel('t');
ylabel('x')

figure();
plot(t,z(:,2));
title('Dinámica de y');
xlabel('t');
ylabel('y')