% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Enero/2022
% Descripcion: Calculo de P. min
% Metodo del gradiente conjugado

clc,clear;

% Encuentre el punto mínimo de la función f (x1, x2) = 4 (x1-5) ^ 2 + (x2-6) ^ 2
% por el método de gradiente conjugado.
% De coordenadas del punto inicial: x0
% De precisión de convergencia: t
% El valor mínimo de la función buscada: f

%% define variables e inicializa
%ejm1
##x0=[8,9];
%ejm2
x0=[0,0];
t=0.001;

syms xi yi a;  % define cada variable de símbolo

%Ejemplo 1
##Z = 4 * (xi-5) ^ 2 + (yi-6) ^ 2;
%Ejemplo 2
Z = ((3/2)*xi^2) + (2*xi*yi) + (3*yi^2) + (-2*xi) + (8*yi);


%%Proceso de cálculo
[x,f_sol,k] = graconj(x0, t, Z, xi, yi, a);


%-----------OUTPUT------------%
printf("\nP.min en (x,y): "); display(x);
printf("Valor min de la funcion: "); display(f_sol);
printf("No. de iteraciones: "); display(k);


%----------Sol. analitica---------%

%Ejemplo 1
##[ X Y] = meshgrid(-3:0.1:9);
##Z = 4 * (X-5) ^ 2 + (Y-6) ^ 2;
%Ejemplo 2
[ X Y] = meshgrid(-4:0.02:6);
Z = ((3/2)*X.^2) + (2*X.*Y) + (3*Y.^2) + (-2*X) + (8*Y);
[Dx Dy] = gradient(Z, 0.1, 0.1);

x_sol=double(x(1));
y_sol=double(x(2));
%Ejemplo 1
##z_sol = 4 * (x_sol-5) ^ 2 + (y_sol-6) ^ 2; % z
%Ejemplo 2
z_sol = ((3/2)*x_sol.^2) + (2*x_sol.*y_sol) + (3*y_sol.^2) + (-2*x_sol) + (8*y_sol);


%----------------PLOT-----------------%

%2D
figure 1
contour(X,Y,Z);
hold on
scatter(x_sol,y_sol,'filled');
quiver(X,Y,Dx,Dy);
xlabel("Eje X");
ylabel("Eje Y");

%3D
figure 2
surf(X,Y,Z);
hold on
scatter3(x_sol,y_sol,z_sol,'filled');
xlabel("Eje X");
ylabel("Eje Y");
zlabel("Eje Z");

