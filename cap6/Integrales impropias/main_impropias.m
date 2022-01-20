% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Integrales impropias

clc,clear;

syms x t;

tic;

#Ejercicio N�1 Modulaci�n por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la se�al de informaci�n que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [0,inf]
#la portadora es cos(x) y se desea saber si la informaci�n se encuentra dentro del intervalo dado bajo el area 
#de la funci�n coseno.


#Ejercicio N�2 Modulaci�n por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la se�al de informaci�n que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [0,inf]
#la portadora es sen(x) y se desea saber si la informaci�n se encuentra dentro del intervalo dado bajo el area 
#de la funci�n seno.


##Definimos la fuci�n.
f = exp(-x/pi); %function
I_exacta=pi;
         
g = exp(-t/pi); %cambio de variable
a = sym(0);
b = sym(2.15);
n = 100;



%%%%%%%%%%%%%%%%%%%%%%

#Graficamos funcion y �rea bajo la curva

y = @(x) exp(-x/pi); %function

hold on

xyinterval=[-3 20 0 2];
h = ezplot (y,xyinterval);
set(h,'LineWidth',2);  % Sets the line width to 2

grid on

x2= 0:0.1:100; %intervalo [a,b] de integracion
y2= y(x2);

x3= -10:0.1:100;      #rango para la gr�fica (plot unicamente)
y3=cos(x2); #evaluar las sinusoides en el mismo intervalo de [a,b]
#y3=sin(x2);
plot(x3,cos(x3), 'LineWidth', 2)  #para coseno
#plot(x3,sin(x3), 'LineWidth', 2)  #para seno
ylim([0 2])

area(x2,y2,"FaceColor", "blue");  #area bajo la curva de la funci�n 
area(x2,y3, "FaceColor", "red");  #area bajo sen o cos. 
area (x2, min ([y2; y3]), "FaceColor", "green");  #AREA COMUN
legend('f(x)','Sinusoide','area f(x)', 'Area sinusoide','modulaci�n')

hold off

%%%%%%%%%%%%%%%%%%




I1 = Trapecio(f,a,b,n);
##I1 = double(I1);
  
I2 = Trapecio(g,a,b,n);
##I2 = double(I2);
  
Integral = I1+I2;

error = I_exacta-Integral;
  
##fprintf('Sumatoria de la funcion: %2.3f\n',fs);
fprintf('Valor real de la integral: %3.3f\n',I_exacta);
fprintf('Valor calculado de la integral: %3.3f\n',Integral);
fprintf('Error: %3.3f\n',error);

toc;
