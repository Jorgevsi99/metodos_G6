% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Antony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Integrales impropias

clc, clear;

syms x;

tic;

#Ejercicio N°1 Modulación por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la señal de información que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [0,inf]
#la portadora es cos(x) y se desea saber si la información se encuentra dentro del intervalo dado bajo el area 
#de la función coseno.


#Ejercicio N°2 Modulación por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la señal de información que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [0,inf]
#la portadora es sen(x) y se desea saber si la información se encuentra dentro del intervalo dado bajo el area 
#de la función seno.


##Definimos la fución.
f = exp(-x/pi); %function
I_exacta=pi;

##Limites de integracion
a = 0;
b = inf;

%Calculo de la integral y parsing a double
I=integ(f,a,b);
I=double(I);
error = I_exacta-I;

fprintf('Valor real de la integral: %3.3f\n',I_exacta);
fprintf('Valor calculado de la integral: %3.3f\n',I);
fprintf('Error: %3.3f\n',error);

%Convergencia
if I==inf
  fprintf("La integral no converge\n");
else
  fprintf("La integral converge\n");
end

%----------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%
#Graficamos funcion y área bajo la curva
y = @(x) exp(-x/pi); %function
hold on
xyinterval=[-3 20 0 2];
h = ezplot (y,xyinterval);

set(h,'LineWidth',2);  % Sets the line width to 2
grid on
x2= 0:0.1:100; %intervalo [a,b] de integracion
y2= y(x2);
x3= -10:0.1:100;      #rango para la gráfica (plot unicamente)
y3=cos(x2); #evaluar las sinusoides en el mismo intervalo de [a,b]
#y3=sin(x2);
plot(x3,cos(x3), 'LineWidth', 2)  #para coseno
#plot(x3,sin(x3), 'LineWidth', 2)  #para seno
ylim([0 2])

area(x2,y2,"FaceColor", "blue");  #area bajo la curva de la función 
area(x2,y3, "FaceColor", "red");  #area bajo sen o cos. 
area (x2, min ([y2; y3]), "FaceColor", "green");  #AREA COMUN
legend('f(x)','Sinusoide','area f(x)', 'Area sinusoide','modulación')
hold off
%%%%%%%%%%%%%%%%%%

toc;
