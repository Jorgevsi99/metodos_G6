% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% GAUSS-CHEBYSHEV

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
f = @(x) (1-exp((-x.^2)/pi)); %function
y = @(x) ((1-exp((-x.^2)/pi))./sqrt(1-x.^2)); %w(x)*f(x)
I_exacta=0.4452466633185060235987528746969716330698182750132774137130616935;


n = 20; %No. puntos de integracion
I="";
c=0.1;

%%%%%%%%%%%%%%%%%%%%%%

#Graficamos funcion y área bajo la curva

hold on

h = ezplot (y);
set(h,'LineWidth',2);  % Sets the line width to 2

grid on

x2= -1:0.001:1; %intervalo [a,b] de integracion
y2= y(x2);

x3= -5:0.1:5;      #rango para la gráfica (plot unicamente)
y3=cos(x2); #evaluar las sinusoides en el mismo intervalo de [a,b]
#y3=sin(x2);
plot(x3,cos(x3), 'LineWidth', 2)  #para coseno
#plot(x3,sin(x3), 'LineWidth', 2)  #para seno

area(x2,y2,"FaceColor", "blue");  #area bajo la curva de la función 
area(x2,y3, "FaceColor", "red");  #area bajo sen o cos. 
area (x2, min ([y2; y3]), "FaceColor", "green");  #AREA COMUN
legend('f(x)','Sinusoide','area f(x)', 'Area sinusoide','modulación')

hold off

%%%%%%%%%%%%%%%%%%

fprintf('\nValor exacto de la integral: %.6f\n',I_exacta);

[integral_c, I] = gausschevy(f, n);
fprintf('\nLa integral usando %d puntos con Gauss-Chveyshev es de %.6f\n',n,integral_c);

[chevy_err] = chevy_e(f, n, c);
fprintf('\nEl error de truncamiento usando %d puntos con Gauss-Chevyshev es de %.6f\n',n,chevy_err);

fprintf('\n\n-------------------------------------------');
fprintf('\nCuadratura Gauss-Chebyshev\n');
fprintf('\n Puntos        Integral        Error\n');
% Loop through the number of integration points (n)
for i=1:n
    % Print
    fprintf(' %6d        %d        %d\n',i,I(i),-I(i)+I_exacta);
end

fprintf('\n\n');


toc;