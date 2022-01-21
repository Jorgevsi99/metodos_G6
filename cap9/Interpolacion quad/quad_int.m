% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Extremos (max o min) de una funcion
% Metodo de interpolacion cuadratica

%INPUTS
%   f=funcion
%   [x0,x2]=intervalo
%   x1=valor medio: x0 < x1 < x2
%   e=tolerancia
%   iter=no de iteraciones

%OUTPUTS
%   f_sol = valor optimo
%   x_sol = x optima
%   j = veces iteradas

function [f_sol,x_sol,j]=quad_int(f,x0,x2,x1,e,iter)
  
  if x0>x2 || ((x0+x2)/2)!=x1
    msgID = 'QUAD_INT:datos';
    msg = 'Ingreso de limites sup. e inf. incorrecto';
    error(msgID,msg);
  endif
  
  i=0; j=0; %Contadores
  
  %Inicializa variables
  x_0 = 1000000; E = 1000; f_sol=0; x_sol=0;
  
  %Evaulacion de valores de x
  f0=f(x0);
  f1=f(x1);
  f2=f(x2);
  
  %Bucle condicional
  while (E>e && (i<iter))
##  for i=1:iter
    i=i+1; j=i+1;  %No. de iteraciones 
    
    N = (f(x0)*(x1^2 - x2^2)) + (f(x1)*(x2^2 + x0^2)) + (f(x2)*(x0^2 - x1^2));
    D = (2*f(x0)*(x1 - x2)) + (2*f(x1)*(x2 - x0)) + (2*f(x2)*(x0 - x1));
##    N = (f0*(x1^2 - x2^2)) + (f1*(x2^2 + x0^2)) + (f2*(x0^2 - x1^2));
##    D = (2*f0*(x1 - x2)) + (2*f1*(x2 - x0)) + (2*f2*(x0 - x1));
    x3 = N/D; %Formula de x optimo
    F=f(x3);  %Formula de valor optimo
    
##    if x0<x3 && x3<x1   %Espacio de busqueda [x0,x1]
##      if F<=f1
##        x2=x1; f2=f1;
##        x1=x3; f1=F;
##      elseif F>f1
##        x0=x3; f0=F;
##      end
##    endif
##    
##    if x1<x3 && x3<x2   %Espacio de busqueda [x1,x2]
##      if F<=f1
##        x0=x1; f0=f1;
##        x1=x3; f1=F;
##      elseif F>f1
##        x2=x3; f2=F;
##      end
##    endif
##    
##    E=abs(x3-x_0);
##    
##    if E<e  %Condicional de calculo de error y solucion
##      x_sol=x3; f_sol=F;
##      break;  %converge
##    endif
##        
##    if i>iter
##      msgID = 'QUAD_INT:iteraciones';
##      msg = 'Gran número de iteraciones, posiblemente el método divergió';
##      error(msgID,msg);
##    endif
    
    x0=x1;
    x1=x2;
    x2=x3;
    
    vec_x(j)=x3;
    E=abs( vec_x(j) - vec_x(j-1) );
    if E<e  %Condicional de calculo de error y solucion
      x_sol=x3; f_sol=F;
      break;  %converge
    endif
    
##  endfor
endwhile
  
  %Resultados
  F=f(x3);
  x_sol=x3; f_sol=F;
  
end