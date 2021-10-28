#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.

#Metodo de Gauss con Pivote Parcial

#De un circuito Resistivo , halle los valores de las Intensidades I1, I2, I3 aplicando leyes de Kirchoff para hallar el sistema de
#Ecuaciones lineales y mediante el metodo de Gauss resolver dicho sistema. 
clc,clear
fprintf('ELIMINACION GAUSSIANA CON PIVOTEO PARCIAL\n');

#Ingreso de datos

A=[1,-1,2,0;2,-2,3,1;3,-3,6,1;0,2,1,1]; #Valores de los coeficientes I1,I2,I3
B=[0;1;-3;4];             #Valores termino indepentiente

#Mostrar datos
disp("La matriz de coeficientes resistivos es:");
disp(A); #imprimie la matriz en pantalla

disp("La matriz de voltajes :");
disp(B);

#probar

try
  [matrizCompleta,pasos,resultados]=ElimiacionGaussPivP(A,B);
  disp("Matriz completa");
  disp (matrizCompleta);
  disp("\n");
  disp("Operaciones en la matriz");
  disp (pasos);
  disp("\n");
  disp("Solucion");
  n=size(resultados,1);
  for i = 1:n
      fprintf('x%d = %f',i,resultados(i));
      fprintf('\n');
  end
  disp("\n")
catch err
  fprintf('Error: %s\n',err.message);
end


