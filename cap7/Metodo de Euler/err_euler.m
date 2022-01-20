% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Problemas de Valores Iniciales 
% Metodo de Euler

#Declaración de la función 
function err = err_euler(f, n, h, eb) #recibe funcion, 
  k=n+1;
  syms x;
  %derivada
  for i=1:k;
      g=diff(f,x);
      f=g;
  end
  
  r=matlabFunction(f);  #sym2func intrinseco
  err = h^k*r(eb)/factorial(k);
  %calculo el porcentaje del error
  err = err *100;