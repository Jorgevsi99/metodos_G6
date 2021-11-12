#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.
##

clc,clear;
format long;
x0=zeros(3,1);
tol=10^(-3);
itmax=300;

disp('Metodo de Jacobi');
#EJEMPLO 1: Del circuito electrico , hallar los valores de las corrientes I1, I2 I3 aplicando las leyes de Kirchoff 
#y resolver el sistema de metodos numéricos aplicando el metodo iterativo de Jacobi.
A=[1,-1,-1;
    6,3,0;
    0,-3,6]; #Valores de los coeficientes I1,I2,I3
b=[0;-4;-10];             #Valores termino indepentiente
disp("Resultado 1");
[x,error,it]=jacobi(A,b,x0,tol,itmax);#se llama a la funcion en el archivo jacobi.m
disp(x);


##EJEMPLO 2
##Se tiene el siguiente cirtuito presentado en el documento. Se necesita hallar los valores de las corrientes que pasan por
##las mallas M1 , M2 , M3 . Para poder hallar el sistema de ecuaciones es necesario realizar el analicis de cada malla aplicando las
##leyes de kirchoff.
##A=[25,0,5
##;0,25,10
##;5,10,15]; #Valores de los coeficientes I1,I2,I3
##b=[15;20;20];             #Valores termino indepentiente
##disp("Resultado 2");
##[x,error,it]=jacobi(A,b,x0,tol,itmax);#se llama a la funcion en el archivo jacobi.m
##disp(x);
##disp("");
##
##METODO DE GAUSS SEIDEL
##
##disp('Metodo de Gauss Seidel');
##EJEMPLO 1: Del circuito electrico , hallar los valores de las corrientes I1, I2 I3 aplicando las leyes de Kirchoff 
##y resolver el sistema de metodos numéricos aplicando el metodo iterativo de Jacobi.
##A=[1,-1,-1;
##    6,3,0;
##    0,-3,6]; #Valores de los coeficientes I1,I2,I3
##b=[0;-4;-10];             #Valores termino indepentiente
##disp("Resultado 1");
##[x,error,it]=gaussseidel(A,b,x0,tol,itmax);#se llama a la funcion en el archivo jacobi.m
##disp(x);
##
##EJEMPLO 2
##Se tiene el siguiente cirtuito presentado en el documento. Se necesita hallar los valores de las corrientes que pasan por
##las mallas M1 , M2 , M3 . Para poder hallar el sistema de ecuaciones es necesario realizar el analicis de cada malla aplicando las
##leyes de kirchoff.
##A=[25,0,5
##;0,25,10
##;5,10,15]; #Valores de los coeficientes I1,I2,I3
##b=[15;20;20];             #Valores termino indepentiente
##disp("Resultado 2");
##[x,error,it]=gaussseidel(A,b,x0,tol,itmax);#se llama a la funcion en el archivo jacobi.m
##disp(x);
##
