% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Diciembre/2021
% Descripcion: Metodos Integraci�n num�rica
%Implementacion de la integracion por legendre

#Ejercicio N�1 Modulaci�n por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion (1-exp(-x/pi))que represeta que tan modulada esta 
#la se�al de informaci�n que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [-pi/2,pi/2]
#la portadora es cos(x) y se desea saber si la informaci�n se encuentra dentro del intervalo dado bajo el area 
#de la funci�n coseno.

#Definimos la fuci�n. 
f=@(x) (1-exp(-x.^2/pi)); #Funci�n
#Definimos los intervalos [-pi/2, pi/2]
x0 = -pi/2;
x1 = pi/2;


#Ejercicio N�2 Modulaci�n por amplitud de pulso (PAM): 
# Necesitamos hallar el area bajo la curva de la funcion (1-exp(-x/pi))que represeta que tan modulada esta 
#la se�al de informaci�n que pasa por un canal digital , teniendo en cuenta que el intervalo de interes es [0,pi]
#la portadora es sen(x) y se desea saber si la informaci�n se encuentra dentro del intervalo dado bajo el area 
#de la funci�n seno.

###Definimos la fuci�n. 
##f=@(x) (1-exp(-x/pi)); #Funci�n
###Definimos los intervalos [0,pi]
##x0 = 0;
##x1 = pi;

disp("******METODO DE LEGENDRE *****");
#Men�
disp("");
disp("n= 2 ------->legendre 2 puntos");
disp("n= 3 ----->legendre 3 puntos");
disp("")
op=0; #incializamos la variable para que entre al bucle
#Validaci�n de entrada
while op ~= 2 : 3
op= input("Escoga una opci�n: ");
end
n=op;
[integral_1] = gausslege(f, x0, x1, n);
%Interpretation of results
fprintf('\nLa solucion usando %.0f puntos con Gauss-Legendre es %.6f\n',n,integral_1);
c = 0.1;
[lege_err] = e_lege(f, n, c);
fprintf('\nEl error usando %.0f puntos con Gauss-Legendre es de %.6f\n',n,lege_err);

#Graficamos funcion y �rea bajo la curva
hold on
ezplot (f)
grid on
#x2= 0:0.1:pi;         #para seno.
x2= -pi/2:0.1:pi/2;  #para coseno. 
x3= -5:0.1:5;      #rango para la gr�fica
y2= f(x2);
plot(x3,cos(x3), 'LineWidth', 2)  #para coseno
#plot(x3,sin(x3), 'LineWidth', 2)  #para seno
area(x2,y2,"FaceColor", "blue");  #area bajo la curva de la funci�n 
area(x2,y3, "FaceColor", "red");  #area bajo sen o cos. 
area (x2, min ([y2; y3]), "FaceColor", "green");
legend('f(x)','Sinusoide','area f(x)', 'Area sinusoide','modulaci�n')
hold off
