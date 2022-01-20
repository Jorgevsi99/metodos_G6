% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% Gauss-Laguerre

%ARGUMENTOS
% f = la funcion a evaluar
% n = no de puntos

function e_hermi = hermi_e(f,n,c)
  
  syms x;
  
  dn=2*n+2;%Orden de derivada
  
  for i=1:dn
    g=diff(f,x);
    f=g;
    
    if f==0
      e_hermi=0;
      break
      
    else
     h = matlabFunction(f); %sym2func valid command
     d = h(c);
     e_hermi=d*(sqrt(pi)*(factorial(n+1))^2)/(4*factorial(2*n+2)); %Error de truncamiento
    end
    
  end
  
end