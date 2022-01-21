#Universidad de Cuenca
#Antony Uquillas, Cristian Marín, Jorge Sanchez.
#Fecha: Eenero/2022

#Metodo de Steepest Descent Method
format short #Mostrar pocos decimales

clc, clear

fprintf('Steepest Descent Method\n');

###Ingreso de datos Ejemplo 1
##[minimos,matrizIteraciones,xm,fm]=SteepestDescent([1 -1 1],1e-7,100);
##
###Mostrar soluciones 
##fprintf('\t k \t   \t  x \t\t    f(x)   ||gradient||\n'); #Para el ejemplo 1
###fprintf('\tk\tx\tf(x)\t||gradient||\n');
##disp(matrizIteraciones);
##fprintf("\n Punto Minimo:");
##disp(xm);
##fprintf("\n Valor minimo de la funcion: %.2f \n",fm);



#Ingreso de datos Ejemplo 2

[minimos,matrizIteraciones,xm,fm]=SteepestDescent([4 4],0.0001,100);

#Imprimimos la matriz
fprintf('\t k   \t  x \t\t    f(x)   ||gradient||\n');
disp(matrizIteraciones);
fprintf("\n Punto minimo:");
disp(xm);
fprintf("\n Valor minimo de la funcion: %.2f \n",fm);

#Grafica
#Cramos la matriz de puntos
[X1,X2]=meshgrid(-5:0.5:5); #meshgrid nos crea la matriz de valores entre un rango
#Evaluamos los puntos con la funcion 
Z=X1.^2+3*X2.^2+1;


#Creamos las subgraficas
#Grafica 1
subplot(1, 3, 1); #subplot nos permite mostrar varias graficas
mesh(X1,X2,Z); #Grafica 3d

#Grafica 2
subplot(1, 3, 2);
contour3(X1,X2,Z); #Graficamos los contornos en 3d
hold on;            #Graficar sobre las graficas

#Graficar los puntos
for i=1:length(minimos) #tamano de matriz de minimos
plot3(minimos(i,1),minimos(i,2),minimos(i,3),".",'Color','r')
end

#Graficar las lineas
for i=1:length(minimos)-1 #recorremos hasta n-1 
quiver3(minimos(i,1),minimos(i,2),minimos(i,3),minimos(i+1,1)-minimos(i,1),minimos(i+1,2)-minimos(i,2),minimos(i+1,3)-minimos(i,3),'ShowArrowHead','off')
end

#Grafica 3
subplot(1, 3, 3);
contour(X1,X2,Z); #Graficamos los contornos en 2d(Curvas de nivel)
hold on;

#Graficar los puntos
for i=1:length(minimos)
plot3(minimos(i,1),minimos(i,2),minimos(i,3),".",'Color','r','MarkerSize',5)
end

#Graficar las lineas
for i=1:length(minimos)-1
quiver3(minimos(i,1),minimos(i,2),minimos(i,3),minimos(i+1,1)-minimos(i,1),minimos(i+1,2)-minimos(i,2),minimos(i+1,3)-minimos(i,3),'ShowArrowHead','off')
end
 