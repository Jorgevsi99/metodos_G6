%Autores: Jorge Sanchez, Cristian Marín, Antony Uquillas. 
#Regla del simpson. 

clear all, clc
syms x;              %Transformamos a 'X' en una variable
%EJEMPLO 1
%Ingresamos los datos 
##f= x**3+4*x**2-10;
##a=sym(0);
##b=sym(2);
##n=10;

%EJEMPLO 2
fun=4-x^2;
a=sym(0);
b=sym(2);
n=10;
%Llamamos a la funcion para que ejecute y analice si esque la raiz no
%existe
[Integral]=Simpson(fun,a,b,n); 
Integral=double(Integral);
%Extaccion final del valor de la integral
%fprintf('El valor de la integral es de %3.3f\n',Integral);
%Graficacion de la funcion
Integral=double(Integral)
hold on
x=a:b/(n-1):b;
y=subs(fun,x);
x=double(x);
y=double(y);
plot(x,y);
area(x,y);
#xlim([a,b])
#fplot(x,[a,b])
grid on
xlabel('x')
ylabel('y')
title('Metodo de Simpson')
hold off
