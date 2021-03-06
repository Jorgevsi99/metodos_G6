% Autores: GRUPO 6: Cristian Marin, Jorge Sanchez, Anthony Uquillas
%
% Fecha: Octubre/2021
% Descripcion: Metodo para resolver ecuaciones con multiples soluciones


clear;
clc;
%%
syms x
xr = input('xr = ');
h = input('h = ');
eps = input('eps = ');
maxit = input('maxit =');
fx = x^2 + 3*x + 2
x2 = xr;
x1 = xr + h*xr;
x0 = xr - h*xr;
f = inline(fx); % subs(fx,x,x0)
%%
iter = 0;
while(iter < maxit)
   iter = iter + 1; 
   h0 = x1 - x0;
   h1 = x2 - x1;
   d0 = (f(x1) - f(x0))/h0;
   d1 = (f(x2) - f(x1))/h1;
   a = (d1 - d0)/(h1 + h0);
   b = a*h1 + d1;
   c = f(x2);
   rad = sqrt(b*b - 4*a*c);
   if(abs(b+rad) > abs(b-rad))
       den = b +rad;
   else
       den = b - rad;
   end
   dxr = -2*c/den;
   xr = x2 + dxr;
   if(abs(dxr) < eps*xr)
       break;
   end
   x0 = x1;
   x1 = x2;
   x2 = xr;  
end
disp('xr')
disp(xr)