% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Extremos (max o min) de una funcion
% Golden Section
% En ciertos casos, mientras mayor sea el intervalo [a,b]
% mayor sera la exactitur de x ^ f optimas

clc,clear;

%FUNCION
%Ejm 1
f=@(x) exp(x.^2) + 2*exp(-x).*x.^2;
%Ejm 2
##f=@(x) -(2*sin(x) - (x.^2)/10);

iter=50;  %No. Iteraciones
a=-1; b=5;  %Valores iniciales Ej.1
e=0.0001;
tau=double((sqrt(5)-1)/2);  %Golden proportion coefficient
##a=0; b=100;  %Valores iniciales Ej.2

try
  
  %LLamada a la funcion
  [f_sol,x_sol,j] = golden(f,a,b,tau,e,iter);

  %Muestra por pantalla x ^ f(x)
  fprintf("x optima aprox.: x=%f\n", x_sol);
  fprintf("Valor optimo aprox: f(x)=%f\n", f_sol);
  fprintf("No. de interaciones: j=%f\n", j);


  %%%%%%%%%% PLOT %%%%%%%%%%%%
  figure
  dom=-b:0.1:b;  %Dominio
  plot(dom,f(dom)); %Grafica de la funcion en ese dominio
  hold on
  plot(x_sol,f_sol,'ro');  %Valor optimo encontrado
  hold off

  legend( 'f(x)', 'Valor optimo');
  xlabel("Eje X");
  ylabel("Eje Y");
  title("QUADRATIC INTERPOLATION SEARCH SEARCH");
  
catch err
  fprintf('Error: %s\n',err.message);
  
end
