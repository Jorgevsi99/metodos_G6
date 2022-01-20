%Nombres: Cristian Marin, Jorge Sanchez, Antony Uquillas
%Fecha: Diciembre/2021
%Descripcion
%Implementacion de Resolucion de sistemas de ecuaciones diferenciales

clc,clear;

%sistema de ecuacioones
f=@(t,x,y) -0.5*x; 
g=@(t,x,y) 4-0.1*x-0.3*y;
%condiciones iniciales
t0=0; 
x0=4;
y0=4;
%condiciones finales
tf=2;
%Numero de pasos
n=8;
%Funcion
[t,x,y]=sis_euler(f,g,t0,tf,x0,y0,n);

fprintf("\n");
display("******METODO DE EULER: SISTEMAS DE ECUACIONES******");
fprintf("\n\ni\tt\t\tx(t)\t\ty(t)\n");
for i=1:(length(x)) %todos los valores hallados/guardados
  fprintf("%i\t%f\t%f\t%f\n",i,t(i),x(i),y(i));
end
fprintf("\n");

plot(t,x)
hold on
plot(t,y)
hold off
xlabel('t')
ylabel('x,y')
legend('x(t)','y(t)')
title('Sistemas de Ecuaciones Diferenciales')
