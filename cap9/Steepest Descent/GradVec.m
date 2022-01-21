# Descripcion : La gradiente de una funcion
# Definicion : Seccion 4.7  (pagina 60)
# x : Punto de entrada
# Output: Grad_Vec : El valor de la gradiente de la funcion

function [grad] = GradVec(x)
delx = 0.001;
grad = [];
for i=1:length(x)
xvec = x;
xvec1 = x;
xvec(i) = x(i) + delx;
xvec1(i) = x(i) - delx;
grad(i) = ( funcionVar(xvec) - funcionVar(xvec1) )/(2*delx);
endfor
end