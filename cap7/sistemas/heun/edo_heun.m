%Nombres: Cristian Marin, Jorge Sanchez, Antony Uquillas
%Fecha: Diciembre/2021
%Descripcion
%Implementacion de Resolucion de sistemas de ecuaciones diferenciales

%ARGUMENTOS
  % f = dy/dx
  % n = numero de pasos
  % x0, y0 = condiciones inciales
%RESPUESTA
  % y1,y2 = funciones

function [y1,y2] = edo_heun(f, g, x0, y0, x1, n)
  
  h=(x1-x0)/n;%pasos
  xs=x0:h:x1;%dominio
  y02 = y0;
  
  for i=1:n
    %ecuación predictora (inicio del intervalo)
    yh = y0 +f(xs(i),y0)*h; %pendiente extrapolada linealmente (y'_i a y0_i+1)
    yh2 = y02 +g(xs(i),y02)*h;
    
    %Pendiente promedio en el intervalo y'_i+1 = f(t_i+1, y0_i+1)
    %_y' = (f(xs(i),y0)+f(xs(i+1),yh))/2
    
    %Ecuacion correctora
    y1 = y0 + (f(xs(i),y0)+f(xs(i+1),yh))*h/2;  %Formula del metodo
    y2 = y02 + (g(xs(i),y02)+g(xs(i+1),yh2))*h/2;
    
    y0 = y1;  %Guarda estado actual de la funcion
    y02 = y2;
  end
  
end