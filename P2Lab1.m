%P2Lab1

%condiciones iniciales
dx0=[0 0];

%Intervalo sobre el cual solucionar
int=[0 10];

%Resolver la EDO num�ricamente
[t,x] = ode45('P2func', int, dx0);

figure();
plot(x(:,1),x(:,2));
title('Din�mica de la curva');
xlabel('x1');
ylabel('x2')
