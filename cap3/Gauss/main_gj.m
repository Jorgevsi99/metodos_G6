#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.

#Metodo de Gauss

#De un circuito Resistivo , halle los valores de las Intensidades I1, I2, I3 aplicando leyes de Kirchoff para hallar el sistema de
#Ecuaciones lineales y mediante el metodo de Gauss resolver dicho sistema. 
clc,clear
disp("Eliminacion de Gauss")

#Ingreso de datos

A=[1,-1,-1;6,3,0;0,-3,6]; #Valores de los coeficientes I1,I2,I3
B=[0;-4;-10];             #Valores termino indepentiente

#Mostrar datos
disp("La matriz de coeficientes resistivos es:")
disp(A) #imprimie la matriz en pantalla

disp("La matriz de voltajes :")
disp(B)

try
  
  #Funcion de eliminacion de Gauss Jordan llamamos a la función.
  #La funcion nos retornara los valores a mostrar
  #-Matriz completa
  #-La matriz de los pasos
  #-El vector de las soluciones.
  [matrizCompleta,pasos,matrizOrdenada,resultados]=MetodoGaussJordan(A,B);
  disp("Matriz completa");
  disp (matrizCompleta);
  disp("\n");
  disp("Matriz odenada");
  disp (matrizOrdenada);
  disp("\n");
  disp("Operaciones en la matriz");
  disp (pasos);
  disp("\n");
  disp("Solucion");
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

