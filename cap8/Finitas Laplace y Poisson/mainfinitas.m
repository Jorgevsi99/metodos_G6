#Univiersidad de Cuenca - Enero 2022 
#Jorge Sanchez, Cristian Marin G , Antony Uquillas.

#Calculo de la Ecuacion diferencia parcial de E. Laplace

clc
clear all;

#Ecuacion caracteristica de Laplace
#d^{2}u/dx^{2} + d^{2}u/dy^{2}  = 0

#Es necesario hallar u 
#x=posicion horizontal
#y = posicion vertical 

#Ejemplo 1 
#Se tiene una placa aislada termicamente y se necesita hallar los valores de temperatura en cada punto.

ua=60;   #Iniciales horizontal
uc=50;   #Iniciales vertical
ub=60;   #condicion incial borde 
ud=70;   #condicion inicial borde
n=10;    #puntos interiores horizontales
m=10;    #puntos interiores verticales
maxiter=100;  #número máximo de maxiteraciones
err=0.001;
#Mandamos a la funcion los parametros de entrada. 
laplacefinitas(ua, ub, uc, ud, n, m, maxiter, err, 1)


##%Ejemplo 2
###Una placa metalica con región R= {(x,y)} en el intervalo 0<=x<=2 y 0<=y <=1.5 , se necesita hallar la 
###corriente que pasa por cada uno de los puntos internos de la regió de la placa
##ua=60; 
##ub=40;
##uc=50;
##ud=80;
##n=10;
##m=10;
##maxiter=100; 
##err=0.001;
###mandamos a la funcion los parámetros de entrada
##laplacefinitas(ua, ub, uc, ud, n, m, maxiter, err, 2)