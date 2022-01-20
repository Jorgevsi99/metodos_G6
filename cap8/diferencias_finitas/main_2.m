%Nombres: Cristian Marin, Jorge Sanchez, Antony Uquillas
%Fecha: Diciembre/2021
%Descripcion: Metodo de diferencias finitas
  %Empleo de esquemas de diferencias finitas para el planteamiento
  %y solución de un problema de valor en la frontera
  
clc,clear;

%ED 4y" - 2y' + y + x = 0; y(0)=1 ^ y(20)=10

%Condiciones iniciales y valores de frontera
x0=0;
y0=1;
xf=20;
yf=10;
%numero de puntos interiores en el dominio x=x0:xf
n=35; %mayor numero de puntos = mayor exactitud

%Llamada a la funcion
[x, y] = diff_fin(x0, y0, xf, yf, n);

%Solucion de la ED
##g=@(xe) -xe-2+(3.439428832*exp(xe.*0.25).*sin(xe.*0.25*sqrt(3)))+(3*exp(xe.*0.25).*cos(xe.*0.25*sqrt(3)));
g= -x-2+(3.439428832*exp(x.*0.25).*sin(x.*0.25*sqrt(3)))+(3*exp(x.*0.25).*cos(x.*0.25*sqrt(3)));

fprintf('\n\n');
fprintf('\nx\t\tsol\t\tdiff_fin\terror_a\t\terror_r\n\n');
%[x' y]   %x transpose ya que es un vector fila

for i=0:n+1 %bucle para imprimir resultados
  %[0:n+1] para considerar los limites de frontera
  
  %calculo de error absoluto y error relativo
  err_ab=g(i+1)-y(i+1);
  %err_rel=err_ab/(g(i+1)*100);
  err_rel=(g(i+1)-y(i+1))/(g(i+1)*100);
  fprintf('%f\t%f\t%f\t%f\t%f\n',x'(i+1), g(i+1), y(i+1), err_ab, err_rel);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Grafica

plot(x,y);
hold on
xe = x0:0.1:xf; %Dominio para grafica
g= -xe-2+(3.439428832*exp(xe.*0.25).*sin(xe.*0.25*sqrt(3)))+(3*exp(xe.*0.25).*cos(xe.*0.25*sqrt(3)));
plot(xe,g)
hold off
legend( 'Solucion Aproximada', 'Primitiva');
xlabel("Eje X");
ylabel("Eje Y");
title("Metodo de Diferencias Finitas");