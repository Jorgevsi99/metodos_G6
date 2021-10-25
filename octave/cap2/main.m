#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.

#Metodo de Gauss

#De un circuito Resistivo , halle los valores de las Intensidades I1, I2, I3 aplicando leyes de Kirchoff para hallar el sistema de
#Ecuaciones lineales y mediante el metodo de Gauss resolver dicho sistema. 

disp("Eliminacion de Gauss")

#Ingreso de datos
A=[1,-1,-1;6,3,0;0,-3,6]; #Valores de los coeficientes I1,I2,I3
B=[0;-4;-10];             #Valores termino indepentiente

#Mostrar datos
disp("La matriz de coeficientes resistivos es:")
disp(A) #imprimie la matriz en pantalla

disp("La matriz de voltajes :")
disp(B)

#Funcion de eliminacion de Gauss llamamos a la función.
ElimiacionGauss(A,B);