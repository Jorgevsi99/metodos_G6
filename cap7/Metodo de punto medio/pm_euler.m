%Nombres: Cristian Marin, Jorge Sanchez, Antony Uquillas
%Fecha: Diciembre/2021
%Descripcion
%Esta funcion metodo de Euler para la resolucion de EDO

%ARGUMENTOS
  % f, la funcion escrita en forma dy/dx
  % n numero de pasos
  % x0, y0 condiciones inciales
  % x1 funcion a cencontrar
%RESPUESTA
% y1 = funcion de x1

function y1 = pm_euler(f,x0,y0,x1,n)
  h=(x1-x0)/n;
  %vector de pasos tomando en cuenta 
  %que ahora el  paso es mas pequeño
  xs=x0:(h/2):x1;
  for i=1:2*n %mayor iteraciones = mayor exactitud
      y1 = y0 + f(x0,y0)*(h/2); #formula del método
      y0 = y1;  #y0 en cada iteración
      x0 = xs(i+1);
  end
end