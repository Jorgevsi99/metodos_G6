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
  %RESPUESTA
  % res = string

function res = estabilidad(f, x0, y0, x1, n)
  
  est = edo_euler(f, x0, y0, x1, n);
  if est ~= inf
      res="Estable";
  else
      res="Inestable";
  end
end