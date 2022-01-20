% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
#Regla del trapecio. 

clear all, clc
syms x;              %Transformamos a 'X' en una variable
%EJEMPLO 1
%Ingresamos los datos 
##f= x^3+4*x^2-10;
##a=sym(0);
##b=sym(2);
##n=10;
%EJEMPLO 2
%f=4-x^2;
f= x^2-x+1
a=sym(0);
b=sym(2);
n=10;
%Llamamos a la funcion para que ejecute y analice si esque la raiz no
%existe
[fs,Integral]=Trapecio(f,a,b,n);    %Extaccion final del valor de la integral y la sumatoria
fs= double(fs); #tranformamos a variable flotante
Integral = double(Integral);#tranformamos a variable flotante
#impresión de resultados
fprintf('Sumatoria de la funcion: %2.3f\n',fs);
fprintf('El valor de la integral es de %3.3f\n',Integral);
%Graficacion de la funcion
hold on
x=a:b/(n-1):b;
y=subs(f,x);
x= double(x);
y = double (y);
plot(x,y) #graficamos 
area(x,y) #graficamos
grid on
xlabel('x')
ylabel('y')
title('Metodo del Trapecio')
hold off

