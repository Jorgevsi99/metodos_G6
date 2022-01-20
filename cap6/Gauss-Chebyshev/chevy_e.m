% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% GAUSS-CHEBYSHEV

%ARGUMENTOS
% f = funcion a evaluar
% n = no de puntos  
% c = valor de c para la formula
% RETURNS: 
% e_chevy = valor del error de truncamiento

function e_chevy = chevy_e(f,n,c)
  
  syms x;
  
  dn=2*n+2; %orden de derivada
  for i=1:dn
    
    g=diff(f,x);
    f=g;
    
    if f==0
      e_chevy=0;
      break
      
    else
     h = matlabFunction(f); %sym2func valid command
     d = h(c);
     e_chevy=d*(2*pi)/(2^(2*n+2)*(factorial(2*n+2))); %Error de truncamiento
    end
    
  end
  
end