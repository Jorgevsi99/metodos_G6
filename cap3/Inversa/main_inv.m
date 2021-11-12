#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.

#Inversa de una matriz

##Un problema común en ingeniería eléctrica consiste en determinar las corrientes 
##y voltajes en un circuito resistivo. Para su solución se usan las Leyes de
##Kirchoff de voltajes y corrientes, cuya aplicación resulta en sistemas de 
##ecuaciones lineales algebraicas, siendo las variables desconocidas las corrientes.
##De un circuito Resistivo , halle los valores de las Intensidades I1, I2, I3
##aplicando leyes de Kirchoff para hallar el sistema de Ecuaciones lineales y 
##mediante el metodo de Gauss resolver dicho sistema.

clc,clear;
disp("Solucion de un Sistema de Ecuaciones\nInversa de una matriz:\n")

#Ingreso de datos

A=[1,-1,-1;6,3,0;0,-3,6]; #Valores de los coeficientes I1,I2,I3
B=[0;-4;-10];             #Valores termino indepentiente
C=[];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


##EJEMPLO 2
##Se tiene el siguiente cirtuito presentado en el documento. Se necesita
##hallar los valores de las corrientes que pasan por las mallas M1 , M2 , M3.
##Para poder hallar el sistema de ecuaciones es necesario realizar
##el analisis de cada malla aplicando las leyes de kirchoff. 

##Ingreso de datos

##A=[25,0,5;0,25,10;5,10,15]; #Valores de los coeficientes I1,I2,I3
##B=[15;20;20];             #Valores termino indepentiente


#Mostrar datos
disp("La matriz de coeficientes resistivos es:")
disp(A) #imprimie la matriz en pantalla

disp("La matriz de voltajes :")
disp(B)

disp("\n");

#Funcion de Inversa de una Matriz: llamamos a la función.

try
  
  [aumentada,identidad,pasos,inversa]=inver(A,B);
  
  disp("Matriz identidad:");
  disp(identidad);
  disp("Matriz aumentada");
  disp(pasos);
  
  if(aumentada==inversa)
##  Hallar la solucion del sistema: [A]^-1 * [B] = [X1;X2;X3]
    C=inversa*B;
    disp("Matriz inversa:");
    disp(inversa);
  endif
  
  disp("\nSoluciones\n");
  n=size(C,1);%n=size(C);
  %--------------------------- impresion de resultados ----------------------
  for i = 1:n
      fprintf('x%d = %f',i,C(i));
      fprintf('\n');
  end
  
catch err
  
  fprintf('Error: %s\n',err.message);
end

