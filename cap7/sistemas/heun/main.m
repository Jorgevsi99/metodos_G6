%Nombres: Cristian Marin, Jorge Sanchez, Antony Uquillas
%Fecha: Diciembre/2021
%Descripcion
%Implementacion de Resolucion de sistemas de ecuaciones diferenciales

clc,clear;

%f=@(x,y) -y/x; g=x.^-1; x0=0.5; y0=2; x1=2; n=4;
%f=@(x,y) -x/y; g=@(x) sqrt(25-x.^2); x0=-4; y0=3; x1=4; n=10;

f=@(x,y) 2*x*y;
g=@(x) exp(x.^2);

%Condiciones
x0=0; y0=1; x1=1; n=1000;

x=x0:0.2:x1;%menor paso -> mayor curvatura
y=[];
y(1)=y0;
u=[];
u(1)=y0;

for i=1:length(x)-1
  [y(i+1), u(i+1)]= edo_heun(f, g, x(i), y(i), x(i+1), n);
end

fprintf("\n");
display("******METODO DE HEUN: SISTEMAS DE ECUACIONES******");
fprintf("\n\ni\ty_cal\n");
for i=1:(length(x)) %todos los valores hallados/guardados
  fprintf("%i\t%f\t%f\n",i,y(i),u(i));
end
fprintf("\n");

fprintf('\nLa aproxiamcion de Heun es: %10.6f\n\n', y(length(x)));
fprintf('\nLa aproxiamcion de Heun es: %10.6f\n\n', u(length(x)));


%%%%%%%%%%%%%%%GRAFICO%%%%%%%%%%%%%%%%%

f=2*x.*y;
g=exp(x.^2);
plot(x, y)
hold on
plot(x, u)
scatter(x, f)
scatter(x, g)
hold off
legend( 'Funcion Heun', 'Primitiva');
xlabel("Eje X");
ylabel("Eje Y");

