% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Integrales impropias

function Integral = Trapecio(f,a,b,n)
  
  %Valores evaluados en la funcion inicial
  f0=subs(f,a);   
  fn=subs(f,b);
  
  h=(b-a)/n;   %dividimos el intervalo [a,b] en n subintervalos de ingual longitud
  fs=0; %Inicio de sumatoria
  
  for i=1:n-1     %Aplicacion del metodo del trapecio
      x(i)=a+h*i;
      fs=fs+subs(f,x(i));         %Sumatoria de la funcion final
  end
  
  %Importante convertir de sym a double antes de proceder con el metodo
  f0=double(f0);
  fn=double(fn);
  fs=double(fs);
##  Integral=0.5*h*(f0+2*fs+fn);    %sumatorio final de la integral
  Integral = h*(f0+fn)/2+h*fs; %formula de regla del trapecio extendida
  Integral = double(Integral); %parsing
