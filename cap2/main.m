% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Octubre/2021
% Descripcion: Metodos para resolver ecuaciones no lineales


% PROBLEMA GENERAL:

% Determinar el punto de inicio de la zona de saturacion de un transistor
% JFET 2N3819 en base a la curva caracteristica de transferencia, dada por
% la ecuacion de Shockley: ID = IDSS(1-(VGS/VP))^2, sabiendo que el punto de
% trabajo para la operacion del modelo del transistor esta dado por los
% valores: Vp=-3V & IDSS=10mA.

clc,clear;

f = @(x) 10*(1-(x./-3)).^2;
d = @(x) (200/3)*(1+(x./3));
a = 0;
b = 2;
datos="";


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Problema 1: BISECCION

% f = @(x) sen(x)+2*x+1;
##f = @(x) x.^2 - 5;
##a = -3;
##b = 0;
##delta = 2;

##try 
##  [y, datos, iter] = biseccion(f,a,b);
##  fprintf('El valor de corte es y=%d, el número de iteraciones es %d\n',y,iter);
##  
##  h=figure(1);
##  x = a-delta:0.1:b+delta;
##  plot (x, f(x), "linewidth", 4);
##  hold on;
##  plot([a a], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
##  text (a+0.1, 1, "a");
##  plot([b b], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
##  text (b+0.1, 1, "b");
##  plot([y y], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
##  text (y+0.1, 1, "y");
##  
##  legend ("f(x)");
##  xlabel ("x");
##  ylabel ("f(x)");
##  set(gca, "linewidth", 4, "fontsize", 12)
##  #set(gca, "xaxislocation", "zero");
##  set(gca, "xaxislocation", "origin")
##  #set(gca, "yaxislocation", "zero");
##  set(gca, "yaxislocation", "origin");
##  set(gca, "box", "on")
##  
##  [n,m] = size(datos)
##  fprintf('Interación\ta\tb\tc\tf(a)\tf(b)\tf(c)\terror\n');
##  for i=1:n
##    fprintf('%d\t',i);
##    for j=1:m
##      fprintf('%d\t',datos(i,j));
##    endfor
##    fprintf('\n');
##  endfor
##  
##
##catch err
##  fprintf('Error: %s\n',err.message);
##  %err.identifier
##end
##
##hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Problema 2: NEWTON RAPHSON

##display('Punto de inicio de la zona de saturacion de un JFET 2N3819:');
##
##try 
##  [y, datos, iter] = newton(f,a,d);
##  fprintf('\nSolucion: x = %d\nNum. de iteraciones: %d\n',y,iter);
##  
##  ezplot(f);
##  hold on;
##  plot(y,0,"or");
##    
##  [n,m] = size(datos);
##  fprintf('\nNo. It\tP. Anterior\tP. Actual\tError\n');
##  for i=1:n
##    fprintf('%d\t',i);
##    for j=1:m
##      fprintf('%d\t',datos(i,j));
##    endfor
##    fprintf('\n');
##  endfor
##  
##
##catch err
##  fprintf('Error: %s\n',err.message);
##  %err.identifier
##end
##
##hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Problema 3: PUNTO FIJO


##display('Punto de inicio de la zona de saturacion de un JFET 2N3819:');
##
##try 
##  [y, datos, iter] = puntoFijo(f,a,d);
##  fprintf('\nSolucion aproximada: x = %d\nNum. de iteraciones: %d\n',y,iter);
##  
##  ezplot(f);
##  hold on;
##  plot(y,0,"or");
##    
##  [n,m] = size(datos);
##  fprintf('\nNo. It\tx_r\t\tError\n');
##  for i=1:n
##    fprintf('%d\t',i);
##    for j=1:m
##      fprintf('%d\t',datos(i,j));
##    endfor
##    fprintf('\n');
##  endfor
##  
##
##catch err
##  fprintf('Error: %s\n',err.message);
##  %err.identifier
##end
##
##hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Problema 4: SECANTE


##display('Punto de inicio de la zona de saturacion de un JFET 2N3819:');
##
##try 
##  [y, datos, iter] = secante(f,a,b);
##  fprintf('\nSolucion: x = %d\nNum. de iteraciones: %d\n',y,iter);
##  
##  ezplot(f);
##  hold on;
##  plot(y,0,"or");
##    
##  [n,m] = size(datos);
##  fprintf('\nNo. It\tP. Anterior\tP. Actual\tError\n');
##  for i=1:n
##    fprintf('%d\t',i);
##    for j=1:m
##      fprintf('%d\t',datos(i,j));
##    endfor
##    fprintf('\n');
##  endfor
##  
##
##catch err
##  fprintf('Error: %s\n',err.message);
##  %err.identifier
##end
##
##hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Problema 5: REGULA FALSI


a=-3.531;
b=-2.648;

display('Punto de inicio de la zona de saturacion de un JFET 2N3819:');

try 
  [y, datos, iter] = regfal(f,a,b);
  fprintf('\nSolucion: x = %d\nNum. de iteraciones: %d\n',y,iter-2);
  
  ezplot(f);
  hold on;
  plot(y,0,"or");
    
  [n,m] = size(datos);
  fprintf('\nNo. It\tP. Anterior\tP. Actual\tError\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor
  

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end

hold off;
