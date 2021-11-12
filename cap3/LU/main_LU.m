#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.

#Factorizacion LU

#De un circuito Resistivo , halle los valores de las Intensidades I1, I2, I3
#aplicando leyes de Kirchoff para hallar el sistema de
#Ecuaciones lineales y mediante factorizacion LU resolver dicho sistema. 
clc,clear
disp("Factorizacion LU: Descomposicion de CROUT\n\n")

#Ingreso de datos

A=[1,-1,-1;6,3,0;0,-3,6]; #Valores de los coeficientes I1,I2,I3
B=[0;-4;-10];             #Valores termino indepentiente

#Mostrar datos
disp("La matriz de coeficientes resistivos es:")
disp(A) #imprimie la matriz en pantalla

disp("\nLa matriz de voltajes :")
disp(B)

disp("\n");

#Funcion de eliminacion de Gauss Jordan llamamos a la función.

try
  
  #Llamada a la funcion
  [resultados,matrizInf,matrizSup,pasos,pasosL,pasosU]=factLU(A,B);

  disp("Matriz inferior L:");
  disp(matrizInf);
  disp("Operaciones en la matriz L:");
  disp(pasosL);
  
  disp("\n");
  
  disp("Matriz superior U:");
  disp (matrizSup);
  disp("Operaciones en la matriz U:");
  disp(pasosU);
  
  disp("\n");
  
  disp("Pasos realizados para Ly=B & Ux=y");
  disp(pasos);
  
  disp("\n");

  disp("\nSolucion:\n");
  n=size(resultados,1);
  %--------------------------- impresion de resultados ----------------------
  for i = 1:n
      fprintf('x%d = %f',i,resultados(i));
      fprintf('\n');
  end
  disp("\n")
  
catch err
  fprintf('Error: %s\n',err.message);
end

