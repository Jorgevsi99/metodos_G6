%Nombres: Cristian Marin/ Jorge Sanchez/ Anthony Uquillas/
%Fecha: Nov/2021
%Descripcion
%Esta funcion aplica el metodo de diferencias finitas
%ARGUMENTOS
% f, la funcion escrita en forma dy/dx
% n numero de pasos
% x0, yx0 condiciones inciales
% xf, yxf condiciones finales
%RESPUESTA
%vector de valores en y

clc,clear;

% set domains limits and boundary conditions
xo = pi/2; xf = pi; yxo = 1; yxf = 1; N = 10;

%FUNCTION
yi = difer_fin(xo, yxo, xf, yxf, N);

display(yi);

##% arranging the matrix a
##%node 1
##a(1,1)=dx2-2; a(1,2)=1+(dx/(xo+dx));  b(1)= ((yxo*dx) /(xo*dx))-yxo;  
##for i = 2:N-1
##  a(i,i-1) = (1-(dx/x(i)));
##  a(i,i) = dx2-2;
##  a(i,i+1) = (1+(dx/x(i)));
##  b(i)=0;
##end        
##a(N,N-1)=(2*xf+2*dx)/xf;  a(N,N-2)=-1;  b(N)=yxf*dx2+yxf+((2*yxf*dx)/xf);
##b=transpose(b);
##b; %NO ELIMINAR
##yi=mldivide(a,b);

%-------------GRAFICA--------------------%

%CALCULO
xe = linspace(xo,xf,N);
plot(xe,yi)
hold on

% analytica solution (exact)  
ye = (pi./(2*xe)).*(sin(xe) - 2*cos(xe));
display(ye);
plot(xe,ye)
hold off

legend( 'Funcion Aproximada', 'Primitiva');
xlabel("Eje X");
ylabel("Eje Y");
title("Metodo de Diferencias Finitas");