% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Calculo de P. min
% Metodo del gradiente conjugado

%INPUTS
 % Coordenadas del punto inicial: x0
 % Precisión de convergencia: t
 % Funcion definida en main: Z
 % Variables simbolyc: xi, yi, a
%OUTPUT
 % Valor minimo: x
 % Valor mínimo de la función buscada: f_sol
 % Total de iteraciones: k


function [x,f_sol,k] = graconj(x0, t, Z, xi, yi, a)
  
   %% define variables e inicializa
   x=x0;
   
   %ejm 1
##   f = 4 * (xi-5) ^ 2 + (yi-6) ^ 2; % Crear expresión simbólica f
   %ejm 2
##   f = ((3/2)*xi^2) + (2*xi*yi) + (3*yi^2) + (-2*xi) + (8*yi);
   f = Z;
   
   fx = diff (f, xi); %derivada parcial con respecto a xi
   fy = diff (f, yi); %derivada parcial con respecto a yi
   
   %Recomendacion: no asignar un dominio definido E -> R, no procede con el calculo correcto
   %sustituye las coordenadas para calcular el valor específico de fx ^ fy
   fx = subs (fx, {xi, yi}, x0);
   fy = subs (fy, {xi, yi}, x0);
   g0 = [fx, fy];  %gradiente inicial del punto
   k = 0; %valor inicial de iteraciones
   
   %Proceso de cálculo
   while (sqrt (fx ^ 2 + fy ^ 2)) >= t % condición de iteración
      if k<=0;
        %primera direccion = steepest descent
        d = -g0;% La primera dirección de búsqueda es la dirección del gradiente negativo del punto inicial
      else
        d=di;
      end
      
      x = x + a * d;% Fórmula de cálculo iterativo, calcula la siguiente fórmula de coordenadas de punto
      f = subs (f, {xi, yi}, x);%Función unaria m(a) para encontrar el tamaño de paso óptimo a
      f1 = diff (f);% diferenciar m(a)
      f1 = solve(f1, a);% Obtener el mejor paso alpha
      
##      display(f1);
      
      if str2double(f1) ~= 0
        ai=f1;
      else
        break% Converge: Si a = 0, salta del bucle, este punto es el punto mínimo
      end
      
      x = subs (x, a, ai);% calcula el valor de coordenadas del siguiente punto
      
      %Nueva asignacion de variables en base a resultados calculados
      
      %ejm1
##      f=4*(xi-5)^2+(yi-6)^2;
      %ejm2
##      f = ((3/2)*xi^2) + (2*xi*yi) + (3*yi^2) + (-2*xi) + (8*yi);
      f = Z;
      
      fxi=diff(f,xi);
      fyi=diff(f,yi);
      fxi=subs(fxi,{xi,yi},x);
      fyi=subs(fyi,{xi,yi},x);
      gi = [fxi, fyi];% dirección del gradiente del siguiente punto
      
      b=(fxi^2+fyi^2)/(fx^2+fy^2);
      
      %obtener la siguiente dirección de búsqueda
      di = -gi + b * d;%Fórmula recursiva para la dirección de búsqueda del conjugado
      
      k = k + 1;
      fx=fxi;
      fy = fyi; %Actualización de parámetros de gradiente para de condiciones de iteración
  end
   %% OUTPUT
   f=subs(f,{xi,yi},x);
   f_sol = f;
end