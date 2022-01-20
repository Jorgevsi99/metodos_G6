%Nombres: Cristian Marin, Jorge Sanchez, Antony Uquillas
%Fecha: Diciembre/2021
%Descripcion: Metodo de diferencias finitas
  %Empleo de esquemas de diferencias finitas para el planteamiento
  %y solución de un problema de valor en la frontera
  
%Input
  %x0,y0 = condiciones de frontera
  %xf,yf = condiciones de frontera
  %n = numero de puntos interiores en el dominio x
%Output
  %x = dominio de x uniformemente espaciado
  %y = solucion de la ED
  
function [x, y] = diff_fin(x0, y0, xf, yf, n)
  
  %Discretizacion de la ED (ubicarse en la i-esima posicion):
  %4y_i" - 2y_i' + y_i + x_i = 0        (1)
  
  %Esquema de diferencias finitas:
  %y_i" = (y_i+1 - 2y_i + y_i-1)/h^2 + O(h^2)
  %y_i' = (y_i+1 - y_i-1)/2h + O(h^2)
  
  %Reemplazando y multiplicando por h^2 en (1):
  %4*(y_i+1 - 2y_i + y_i-1) - h*(y_i+1 - y_i-1) + h^2*(y_i + x_i) = 0
  
  %Reorganizando:
  %(4-h)y_i+1 + (-8+h^2)y_i + (4+h)y_i-1 = -h^2*x_i     (2)

  h=(xf-x0)/(n+1);  %tamanno de paso
  x = linspace(x0,xf,n+2);  %dominio: conjunto uniformemente espaciado
  b=zeros(n,1);     %vector fila de n componentes
  A=eye(n)*(h^2-8); %Matriz identidad nxn cuya diagonal es (h^2-8)
  %(h^2-8) es el coeficiente que acompanna a y_i en (2)
    
  %Bucle para construir sistema de ecuaciones
  for i=1:n-1
    A(i,i+1)=-h+4;    %coeficiente que acompanna a y_i+1 en (2)
    A(i+1,i)=h+4;     %coeficiente que acompanna a y_i-1 en (2)
    b(i)=-h^2*x(i+1); %coeficiente que acompanna a x_i en (2)
  end
  
  %La primera y la ultima ecuacion se tratan de manera diferente
  b(1)=-h^2*x(1)-9*y0;
  %b(1)= ((y0*h)/(x0*h))-y0;
  b(n)=-h^2*x(n+1)+yf;
  
  %[A b]
  
  %Solucion del sistema de ecuaciones
  y=A\b;  %operador \ resuelve sistemas de ecuaciones lineales
          %de la forma A*y=b
  %y=inv(A)*b;
  y=[y0;y;yf];  %annadimos los valores de y0 ^ yf

end