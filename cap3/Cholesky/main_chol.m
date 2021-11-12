#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.

#EJEMPLO 1
#De un circuito Resistivo , halle los valores de las Intensidades I1, I2, I3 aplicando leyes de Kirchoff para hallar el sistema de
###Ecuaciones lineales y mediante el metodo de Gauss resolver dicho sistema. 
##clc,clear
##format long
##disp("Factorizacion de cholesky")
##
###Ingreso de datos
##
##A=[1,-1,-1;6,3,0;0,-3,6]; #Valores de los coeficientes I1,I2,I3
##b=[0;-4;-10];             #Valores termino indepentiente
##
###Mostrar datos
##disp("La matriz de coeficientes resistivos es:");
##disp(A); #imprimie la matriz en pantalla
##
##disp("La matriz de voltajes :");
##disp(b);
##
###Funcion de eliminacion de Gauss Jordan llamamos a la función.
###La funcion nos retornara los valores a mostrar
###-Matriz completa
###-La matriz de los pasos
###-El vector de las soluciones.
##[C, L, u, z, x, n]=choleskyfun(A,b);
##fprintf('\n Matriz Completa:\n');
##disp(C);
##fprintf('\n Matriz L:\n');
##disp(L);
##fprintf('\n Matriz U:\n');
##disp(u);
##fprintf('\n El vector Z:\n');
##disp(z);
##    
##
##fprintf('\n\nLa solucion de X1 hasta Xn es:\n'); 
##%--------------------------- impresion de resultados ----------------------
##for i=1:n
##    xi=x(1,i);
##    fprintf('\nX%g=',i)
##    disp(xi);
##end



#EJEMPLO 2
#Se tiene el siguiente cirtuito presentado en el documento. Se necesita hallar los valores de las corrientes que pasan por
#las mallas M1 , M2 , M3 . Para poder hallar el sistema de ecuaciones es necesario realizar el analicis de cada malla aplicando las
#leyes de kirchoff. 

clc,clear
format long
disp("Factorizacion de cholesky")

#Ingreso de datos

A=[25,0,5;0,25,10;5,10,15]; #Valores de los coeficientes I1,I2,I3
b=[15;20;20];             #Valores termino indepentiente

#Mostrar datos
disp("La matriz de coeficientes resistivos es:");
disp(A); #imprimie la matriz en pantalla

disp("La matriz de voltajes :");
disp(b);

#Funcion de eliminacion de Gauss Jordan llamamos a la función.
#La funcion nos retornara los valores a mostrar
#-Matriz completa
#-La matriz de los pasos
#-El vector de las soluciones.
[C, L, u, z, x, n]=choleskyfun(A,b);
fprintf('\n Matriz Completa:\n');
disp(C);
fprintf('\n Matriz L:\n');
disp(L);
fprintf('\n Matriz U:\n');
disp(u);
fprintf('\n El vector Z:\n');
disp(z);
    

fprintf('\n\nLa solucion de X1 hasta Xn es:\n'); 
%--------------------------- impresion de resultados ----------------------
for i=1:n
    xi=x(1,i);
    fprintf('\nX%g=',i)
    disp(xi);
end
