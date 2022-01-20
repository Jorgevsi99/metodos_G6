% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% Gauss-Hermite

clc,clear;

tic;

#Ejercicio N°1 Modulación por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la señal de información que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [-1,1]
#la portadora es cos(x) y se desea saber si la información se encuentra dentro del intervalo dado bajo el area 
#de la función coseno.


#Ejercicio N°2 Modulación por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la señal de información que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [-1,1]
#la portadora es sen(x) y se desea saber si la información se encuentra dentro del intervalo dado bajo el area 
#de la función seno.

##Definimos la fución.
f = @(x) (1-exp(-x.^2/pi)); %function
y = @(x) ((1-exp(-x.^2/pi))./exp(x.^2)); %w(x)*f(x)
I_exacta=0.045470236598866350303362138667532536051260404972983832024517605;

n = 4; %No. puntos de integracion
I="";
c=0;


%%%%%%%%%%%%%%%%%%%%%%

#Graficamos funcion y área bajo la curva

hold on

h = ezplot (y);
set(h,'LineWidth',2);  % Sets the line width to 2

grid on

x2= -10:0.001:10; %intervalo [a,b] de integracion
y2= y(x2);

x3= -10:0.1:10;      #rango para la gráfica (plot unicamente)
y3=cos(x2); #evaluar las sinusoides en el mismo intervalo de [a,b]
#y3=sin(x2);
plot(x3,cos(x3), 'LineWidth', 2)  #para coseno
#plot(x3,sin(x3), 'LineWidth', 2)  #para seno

area(x2,y3, "FaceColor", "red");  #area bajo sen o cos. 
area(x2,y2,"FaceColor", "blue");  #area bajo la curva de la función 
area (x2, min ([y2; y3]), "FaceColor", "green");  #AREA COMUN
legend('f(x)','Sinusoide','area sinusoide', 'Area f(x)','modulación')

hold off

%%%%%%%%%%%%%%%%%%

fprintf('\nValor exacto de la integral: %.6f\n',I_exacta);

[integral_1, I] = gausshermi(f, n);
fprintf('\nLa solucion usando Gauss-Hermite es %.6f\n',integral_1);

[hermi_err] = hermi_e(f, n, c);
fprintf('\nEl error de truncamiento usando %.0f puntos con Gauss-Hermite es de %.6f\n',n,hermi_err);

fprintf('\n\n-------------------------------------------');
fprintf('\nCuadratura Gauss-Hermite\n');
fprintf('\n Puntos        Integral        Error\n');
% Loop through the number of integration points (n)
for i=1:n
    % Print
    fprintf(' %6d        %d        %d\n',i,I(i),-I(i)+I_exacta);
end

fprintf('\n\n');

toc;

