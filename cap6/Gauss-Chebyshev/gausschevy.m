% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% GAUSS-CHEBYSHEV

%ARGUMENTOS
% f = funcion a evaluar
% n = no de puntos  
% RETURNS: 
% I = valor de la integral
% Inte = vector que contiene todos los valores de I en cada iteracion

function [I, Inte] = gausschevy(f,n)
  
  I=0;
  sum=0;
  wi = pi/(n+1);
  
  for i=0:n
    xi = cos(pi*(2*i+1)/(2*n+2)); %Valor de xi
    fxi = f(xi); %Evaluar xi en f --> f(xi)
    sum = sum + fxi ; %Ejecutar la sumatoria
    I = wi*sum; %Resultado de la integral
    Inte(i+1) = I; %Guardar estado actual de I en memoria
  end
   
  
end