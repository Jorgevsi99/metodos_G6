% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integraci�n num�rica
% Gauss-Laguerre

clc,clear;

tic;

#Ejercicio N�1 Modulaci�n por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la se�al de informaci�n que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [-1,1]
#la portadora es cos(x) y se desea saber si la informaci�n se encuentra dentro del intervalo dado bajo el area 
#de la funci�n coseno.


#Ejercicio N�2 Modulaci�n por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion que represeta que tan modulada esta 
#la se�al de informaci�n que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [-1,1]
#la portadora es sen(x) y se desea saber si la informaci�n se encuentra dentro del intervalo dado bajo el area 
#de la funci�n seno.

##Definimos la fuci�n.
f = @(x) (1-exp(-x/pi)); %function
y = @(x) ((1-exp(-x/pi))./exp(x)); %w(x)*f(x)
I_exacta=1/(1+pi);


n = 5; %No. puntos de integracion
I="";
c=10;


%%%%%%%%%%%%%%%%%%%%%%

#Graficamos funcion y �rea bajo la curva

hold on

xyinterval=[-5 10 -2 2];
h = ezplot (y,xyinterval);
set(h,'LineWidth',2);  % Sets the line width to 2

grid on

x2= 0:0.001:10; %intervalo [a,b] de integracion
y2= y(x2);

x3= -10:0.1:10;      #rango para la gr�fica (plot unicamente)
y3=cos(x2); #evaluar las sinusoides en el mismo intervalo de [a,b]
#y3=sin(x2);
plot(x3,cos(x3), 'LineWidth', 2)  #para coseno
#plot(x3,sin(x3), 'LineWidth', 2)  #para seno
ylim([-2 2])

area(x2,y2,"FaceColor", "blue");  #area bajo la curva de la funci�n 
area(x2,y3, "FaceColor", "red");  #area bajo sen o cos. 
area (x2, min ([y2; y3]), "FaceColor", "green");  #AREA COMUN
legend('f(x)','Sinusoide','area f(x)', 'Area sinusoide','modulaci�n')

hold off

%%%%%%%%%%%%%%%%%%

fprintf('\nValor exacto de la integral: %.6f\n',I_exacta);

[integral_g, I] = gausslaguer(f, n);
fprintf('\nLa integral usando %.0f terminos con Gauss-Laguerre es de %.6f\n',n,integral_g);

[laguer_err] = laguer_e(f, n, c);
fprintf('\nEl error de truncamiento usando %.0f puntos con Gauss-Laguerre es de %.6f\n',n,laguer_err);

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
