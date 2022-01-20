% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021

%ARGUMENTOS
  % f = dy/dx
  % x0, y0 = condiciones inciales
  % x1 = funcion a cencontrar
  % h = paso
  % os = orden
  
  % x,y = valores de la funcion

function [x, y] = runge_kutta(f,x0,y0,x1,h,os)

  x = x0:h:x1;%dominio
  y = zeros(1,length(x));%rango
  y(1) = y0; % condicion inicial
  
  switch os
    case 2
      %Segundo orden (metodo de Ralston)
      for i=1:(length(x)-1)
        k1 = f(x(i),y(i));
        k2 = f(x(i)+0.75*h,y(i)+0.75*h*k1);
        y(i+1) = y(i) + (k1/3+2*k2/3)*h;  %formula del metodo
      end
    case 3
      %Tercer Orden
      for i=1:(length(x)-1)
        k1 = f(x(i),y(i));
        k2 = f(x(i)+0.5*h,y(i)+0.5*h*k1);
        k3 = f((x(i)+h),(y(i)-k1*h+2*h*k2));
        y(i+1) = y(i) + (1/6)*(k1+4*k2+k3)*h;  % formula del metodo
      end
    otherwise
    disp('other value')
  end

end