% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Problemas de Valores Iniciales
% Implementacion de Runge Kutta

clc,clear;

#Ejemplo 1: Se tiene un circuito en RL en serie , la ecuacion diferencial caracteristica
#representa de la  forma dy/dx=2*x*y , Evalaren el intervalo [0,1] con un h=0.1. La condición
#inicial es x=0 y=1

#ECUACIÓN DIFERENCIAL
f=@(x,y) 2*x*y;
#solucion analitica de la EDO
g=@(x) exp(x.^2);
#CONDICIONES INICIALES
x0=0; x1=1;
y0=1;
##n=4;
h=0.1;%a mayor h menos presicion y mas diferencia entre los ordenes
%(h=0.1 es mas preciso y da menos diferencia que h=0.5)


#Ejemplo 2: Aplicando el método de Euler integre numéricamente la siguiente ecuación
#ecuación diferencia que describe el comportamiento de un sistema mecánico
# dy/dx = -2x^(3) + 12x^(2) + 8.5 en el intervalo [0,4] con un h=0.5 . La condición incial
# en x=0 es y=1

###ECUACIÓN DIFERENCIAL
##f=@(x,y) -2*x^3+12*x^2-20*x+8.5;
###solucion analitica de la EDO
##g=@(x) -0.5*x^4+4*x^3-10*x^2+8.5*x+1;
###CONDICIONES INICIALES
##x0=0; x1=4; 
##y0=1;
####n=70;
##h=0.5;

[x, y]=runge_kutta(f,x0,y0,x1,h,2); %Metodo de Runge Kutta de segundo orden
[u, v]=runge_kutta(f,x0,y0,x1,h,3); %Metodo de Runge Kutta de segundo orden

%SEGUNDO ORDEN
fprintf("\n");
display("******METODO DE RUNGE KUTTA SEGUNDO ORDEN******");
fprintf("\n\ni\tx\t\ty_cal\n");
for i=1:(length(x)) %todos los valores hallados/guardados
  fprintf("%i\t%f\t%f\n",i,x(i),y(i));
end

fprintf('\nLa aproxiamcion mediante Runge Kutta es: %f\n\n',y(length(x)));%Ultimo valor

%TERCER ORDEN
fprintf("\n\n");
display("******METODO DE RUNGE KUTTA TERCER ORDEN******");
fprintf("\n\ni\tx\t\ty_cal\n");
for i=1:(length(u)) %todos los valores hallados/guardados
  fprintf("%i\t%f\t%f\n",i,u(i),v(i));
end

fprintf('\nLa aproxiamcion mediante Runge Kutta es: %f\n\n',v(length(u)));%Ultimo valor

##g= -x -1 -exp(x);
g = exp(x.^2); %problema 1
##g = -0.5*x^4+4*x^3-10*x^2+8.5*x+1; %problema 2
plot(x,y)
hold on
plot(u, v)
hold on
scatter(x, g)
hold off
legend( 'Segundo Orden','Tercer Orden','Primitiva');
xlabel("Eje X");
ylabel("Eje Y");
title("Metodo de Runge Kutta");