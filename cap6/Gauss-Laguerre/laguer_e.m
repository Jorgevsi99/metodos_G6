% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% Gauss-Laguerre

%ARGUMENTOS
% f = la funcion a evaluar
% n = no de puntos

function e_laguer = laguer_e(f,n,c)
  
  syms x;
  
  dn=2*n+2;%Orden de derivada
  
  for i=1:dn
    g=diff(f,x);
    f=g;
    
    if f==0
      e_laguer=0;
      break
      
    else
     h = matlabFunction(f); %sym2func valid command
     d = h(c);
     e_laguer=d*((factorial(n+1))^2)/(factorial(2*n+2)); %Error de truncamiento
    end
    
  end
  
end