% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Problemas de Valores Iniciales 
% Metodo de Euler

clc,clear;

#Ejemplo 1: Se tiene un circuito en RL en serie , la ecuacion diferencial caracteristica  
#representa de la  forma dy/dx=2*x*y , Evalaren el intervalo [0,1] con un n=7. La condici�n
#inicial es x=0 y=1

#ECUACI�N DIFERENCIAL
f=@(x,y) 2*x*y; 
#solucion analitica de la EDO
g=@(x) exp(x.^2); 
#CONDICIONES INICIALES
x0=0;  x1=1; 
y0=1; 
n=3;   


#Ejemplo 2: Aplicando el m�todo de Euler integre num�ricamente la siguiente ecuaci�n
#ecuaci�n diferencia que describe el comportamiento del Voltaje a traves de un circuito cerrado RC
# dy/dx = -2x^(3) + 12x^(2) + 8.5 en el intervalo [0,4] con un n=0.5 . La condici�n incial
# en x=0 es y=1

###ECUACI�N DIFERENCIAL
##f=@(x,y) -2*x^3+12*x^2-20*x+8.5;
###solucion analitica de la EDO
##g=@(x) -0.5*x^4+4*x^3-10*x^2+8.5*x+1;
###CONDICIONES INICIALES
##x0=0; x1=4; 
##y0=1;
##n=70;


[aprox] = pm_euler(f, x0, y0, x1, n);
fprintf('\nLa aproxiamcion de Euler Punto Medio es: %10.6f\n',aprox);

%Grafica
x=x0:0.1:x1;
h=[];
h(1)=y0;
for i=1:length(x)-1
  h(i+1)= pm_euler(f, x(i), h(i), x(i+1), n);#obtencion de grafica de euler
end

g=exp(x.^2);  #ejm 1
%g=-0.5*x^4+4*x^3-10*x^2+8.5*x+1; #ejm 2
plot(x, h)
hold on
scatter(x, g)
hold off
legend( 'F. Punto medio', 'Primitiva');
xlabel("Eje X");
ylabel("Eje Y");
title("Metodo de Euler Comparacion");
