% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Problemas de Valores Iniciales 
% Metodo de Euler

%ARGUMENTOS
  % f, la funcion escrita en forma dy/dx
  % n numero de pasos
  % x0, y0 condiciones inciales
  % x1 funcion a cencontrar

function y1 = edo_euler(f,x0,y0,x1,n)  

  h=(x1-x0)/n;  #calculo de Número paso de integracion

  xs=x0:h:x1;  #vector de tiempos

  for i=1:n
      y1 = y0 + f(x0,y0)*h;  #formula del método
      y0 = y1;   #y0 en cada iteración
      x0 = xs(i+1);
  end
end