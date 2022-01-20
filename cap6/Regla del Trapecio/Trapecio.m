function [fs,Integral]=Trapecio(f,a,b,n)
f0=subs(f,a);   %Valores evaluados en la funcion inicial
fn=subs(f,b);
h=(b-a)/n;   %dividimos el intervalo [a,b] en n subintervalos de ingual longitud
fs=0;
for i=1:n-1     %Aplicacion del metodo del trapecio
    x(i)=a+h*i;
    fs=fs+subs(f,x(i));         %Sumatoria de la funcion final
end          
Integral=0.5*h*(f0+2*fs+fn);    %sumatorio final de la integral
