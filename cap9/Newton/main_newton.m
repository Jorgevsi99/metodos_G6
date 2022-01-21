% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Max de una funcion
% Metodo de Newton

clc,clear;

%Ejercicio 1
%Se desarrolla la siguient ecuacion diferencial, en la cual se muestra la siguiente
%       f: Siendo la ecuacion original
%       f1: Primera derivada 
%       f2: Segunda derivada
%       N: Numero de iteraciones
%       x: Valor Inicial
%       err: Error de referencia

% ---------------------------------------------------------------------

f = @(x) 2*sin(x) - 0.1*x^2;
f1 = @(x) 2*cos(x) -0.2*x;
f2 = @(x) -2*sin(x) - 0.2;

##f = @(x) 5*cos(x) - 0.2*x^2
##f1 = @(x) -5*sin(x) - 0.4*x
##f2 = @(x) -5*cos(x) - 0.4

N=100;
x=2.5;
xx(1) = x;
err = 0.0001;

#Metodo de Newton

try
  
  %LLamada a la funcion
  [x_sol,FF,ii,Err] = Newton(f,f1,f2,N,x,xx,err);

  %--------- Impresion de datos -------------------------
  printf("El valor optimo de: %.2f \n",x_sol);
  printf("Es %.2f \n", FF);
  printf("Con el numero de iteraciones es: %.2f \n", ii);
  printf("El error del metodo es %.2f \n",Err);

  %-------------- Plot ------------------------
  hold on
  x_dom = 0:0.1:10;   %Dominio de grafica
  F = 2.*sin(x_dom) - 0.1.*x_dom.^2;  %f(x)
  ##F = 5.*cos(x) - 0.2.*x.^2;
  plot(x_dom,F);  %Grafica  
  plot(x_sol,FF,'o'); %Solucion
  grid on
  hold off 

  legend( 'f(x)', 'Valor optimo');
  xlabel("Eje X");
  ylabel("Eje Y");
  title("EULER METHOD");
  
catch err
  fprintf('Error: %s\n',err.message);
  
end
