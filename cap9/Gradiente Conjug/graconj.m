% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Calculo de P. min
% Metodo del gradiente conjugado

%INPUTS
 % Coordenadas del punto inicial: x0
 % Precisi�n de convergencia: t
 % Funcion definida en main: Z
 % Variables simbolyc: xi, yi, a
%OUTPUT
 % Valor minimo: x
 % Valor m�nimo de la funci�n buscada: f_sol
 % Total de iteraciones: k


function [x,f_sol,k] = graconj(x0, t, Z, xi, yi, a)
  
   %% define variables e inicializa
   x=x0;
   
   %ejm 1
##   f = 4 * (xi-5) ^ 2 + (yi-6) ^ 2; % Crear expresi�n simb�lica f
   %ejm 2
##   f = ((3/2)*xi^2) + (2*xi*yi) + (3*yi^2) + (-2*xi) + (8*yi);
   f = Z;
   
   fx = diff (f, xi); %derivada parcial con respecto a xi
   fy = diff (f, yi); %derivada parcial con respecto a yi
   
   %Recomendacion: no asignar un dominio definido E -> R, no procede con el calculo correcto
   %sustituye las coordenadas para calcular el valor espec�fico de fx ^ fy
   fx = subs (fx, {xi, yi}, x0);
   fy = subs (fy, {xi, yi}, x0);
   g0 = [fx, fy];  %gradiente inicial del punto
   k = 0; %valor inicial de iteraciones
   
   %Proceso de c�lculo
   while (sqrt (fx ^ 2 + fy ^ 2)) >= t % condici�n de iteraci�n
      if k<=0;
        %primera direccion = steepest descent
        d = -g0;% La primera direcci�n de b�squeda es la direcci�n del gradiente negativo del punto inicial
      else
        d=di;
      end
      
      x = x + a * d;% F�rmula de c�lculo iterativo, calcula la siguiente f�rmula de coordenadas de punto
      f = subs (f, {xi, yi}, x);%Funci�n unaria m(a) para encontrar el tama�o de paso �ptimo a
      f1 = diff (f);% diferenciar m(a)
      f1 = solve(f1, a);% Obtener el mejor paso alpha
      
##      display(f1);
      
      if str2double(f1) ~= 0
        ai=f1;
      else
        break% Converge: Si a = 0, salta del bucle, este punto es el punto m�nimo
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
      gi = [fxi, fyi];% direcci�n del gradiente del siguiente punto
      
      b=(fxi^2+fyi^2)/(fx^2+fy^2);
      
      %obtener la siguiente direcci�n de b�squeda
      di = -gi + b * d;%F�rmula recursiva para la direcci�n de b�squeda del conjugado
      
      k = k + 1;
      fx=fxi;
      fy = fyi; %Actualizaci�n de par�metros de gradiente para de condiciones de iteraci�n
  end
   %% OUTPUT
   f=subs(f,{xi,yi},x);
   f_sol = f;
end