% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integración numérica
% Gauss-Hermite

%ARGUMENTOS
% f = funcion a evaluar
% n = no de puntos  
% RETURNS: 
% I = valor de la integral
% Inte = vector que contiene todos los valores de I en cada iteracion

function [I, Inte]=gausshermi(f,n)  
  
  syms x;

  I=0;
  sum=0;
##  Hn=0;
##  H_n=cell(n+1);
##  wi=0;
##  double(wi);
  
  x_i=[0 0.958572 2.020183];
  A_i=[0.724629 0.157067 0.453001e-2];
  
##  for i=0:n
##    %polinomios de Hermite Hn(x)
##    if i==0
##      Hn = exp(-x.^2);
##      g = Hn;
##      Hn = diff(g,x);
##      H_n(1,i+1)=Hn;
##    else
##      Hn = diff(g,x);
##      g=Hn;
##      H_n(1,i+1)=Hn;
##    end
##  end
  
  %sym2func valid command
##  h = matlabFunction(H_n{1,n}); %n-esima derivada FIJA
    
  for i=0:n
    
    if i<n-1
      xi = x_i(i+1); %Valor de xi
      Ai = A_i(i+1); %Valor de Ai
    end
    
    fxi=f(xi); %Evaluar xi en f --> f(xi)
    
##    if i==0
##      wi=(sqrt(pi)*factorial(n)*(2^(n-1)))/(n^2); %Valor de peso wi
##    else
####      %aux para el polinomio Hn actual
####      h = matlabFunction(H_n{1,i}); %sym2func valid command
##      wi=(sqrt(pi)*factorial(n)*(2^(n-1)))/((n^2)*(((-1^n)*(exp(xi^2))*(h(xi)))^2)); %Valor de peso wi
##    end
        
##    sum=sum + (fxi*wi); %Ejecutar la sumatoria
    sum=sum + (Ai*fxi); %Ejecutar la sumatoria
    Inte(i+1)=sum; %Guardar estado actual de la sumatoria
    
  end
  
  I=sum; %Resultado de la integral
  
  
end
