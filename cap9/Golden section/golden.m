% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Extremos (max o min) de una funcion
% Metodo de interpolacion cuadratica

%INPUTS
%   f=funcion
%   [a,b]=intervalo
%   x1=valor medio: a < x1 < b
%   e=tolerancia
%   iter=no de iteraciones

%OUTPUTS
%   f_sol = valor optimo
%   x_sol = x optima
%   i = veces iteradas

function [f_sol,x_sol,i]=golden(f,a,b,tau,e,iter)
  
  if a>b
    msgID = 'QUAD_INT:datos';
    msg = 'Ingreso de limites sup. e inf. incorrecto';
    error(msgID,msg);
  endif
  
  i=0;%Contador
  
  %Inicializa variables
  f_sol=0; x_sol=0; E=1;
  
  %Calculo de valores de x
  x1=a+(1-tau)*(b-a);
  x2=a+tau*(b-a);
  
  %Evaulacion de valores de x
  f1=f(x1);
  f2=f(x2);
  
  %Bucle condicional
  while (E>e && (i<iter))
##  for i=1:iter
    i=i+1;  %No. de iteraciones 
    
    if(f1<f2)
      b=x2;
      x2=x1;
      x1=a+(1-tau)*(b-a);
      
      f1=f(x1);
      f2=f(x2);
    else
      a=x1;
      x1=x2;
      x2=a+tau*(b-a);
      
      f1=f(x1);
      f2=f(x2);
    end
    
    E=f1-f2;
    
    if(E<e)
      break; %converge
    endif
    
    i=i+1;
    
  endwhile
  
  %Resultados
  
  if(f1<f2)
    f_sol=f1; x_sol=x1;
  else
    f_sol=f2; x_sol=x2;
  end
  
end