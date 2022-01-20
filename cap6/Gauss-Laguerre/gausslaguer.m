% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% Gauss-Laguerre

%ARGUMENTOS
% f = funcion a evaluar
% n = no de puntos  
% RETURNS: 
% I = valor de la integral
% Inte = vector que contiene todos los valores de I en cada iteracion

function [I, Inte] = gausslaguer(f,n)
  
  syms x;

  I=0;
  sum=0;
##  Ln=0;
##  L_n=cell(n+1);
##  wi=0;
##  double(wi);
  
  x_i=[0.222847 1.188932 2.992736 5.775144 9.837467 15.982874];
  A_i=[0.458964 0.417000 0.113373 0.103992e-1 0.261017e-3 0.898548e-6];
  
##  for i=0:n
##    %polinomios de Laguerre Ln(x)
##    %polinomios de Laguerre Ln(x)
##    if i==0
##      Ln = (x.^i).*(exp(-x));
##      g = Ln;
##      Ln = diff(g,x);
##      L_n(1,i+1)=Ln;
##    else
##      Ln = diff(g,x);
##      g=Ln;
##      L_n(1,i+1)=Ln;
##    end
##  end
  
  %sym2func valid command
##  h = matlabFunction(Ln); %n-esima derivada FIJA
  
  for i=0:n
    xi = x_i(i+1); %Valor de xi
    fxi=f(xi); %Evaluar xi en f --> f(xi)
    
##    %aux para el polinomio Ln actual
##    h = matlabFunction(L_n{1,i+1}); 
    
##    wi=xi/(((n+1)^2)*((exp(xi)/factorial(n))*(h(xi))^2)); %Valor de peso wi
    Ai = A_i(i+1);
    
##    sum=sum + (fxi*wi); %Ejecutar la sumatoria
    sum=sum + (Ai*fxi); %Ejecutar la sumatoria
    Inte(i+1)=sum; %Guardar estado actual de la sumatoria
  end
  
  I=sum; %Resultado de la integral
  
  
end