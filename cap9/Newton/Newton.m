#Antony Uquillas, Cristian Marín, Jorge Sanchez.
#Fecha: Eenero/2022
%INPUT
%       f: Siendo la ecuacion original
%       f1: Primera derivada 
%       f2: Segunda derivada
%       N: Numero de iteraciones
%       x: Valor Inicial
%       err: Error de referencia
%OUTPUT
%       x_sol, FF: valor optimo
%       ii: interaciones
%       Err: error
#Metodo de Newton

function [x_sol,FF,ii,Err] = Newton(f,f1,f2,N,x,xx,err)
  
##  if f==f1==f2
##    msgID = 'Newton:datos';
##    msg = 'Error de ingreso de funciones y/o derivadas';
##    error(msgID,msg);
##  endif
  
  x_sol=x;
  i=1; ii=0;
  Err=0;
  
##  while (Err>err && (i<N))
  for i = 1:N
    x_sol = x_sol - f1(x_sol)/f2(x_sol);
    j = i + 1;
    xx(j) = x_sol; ii = i;
    Err = abs(xx(j) - xx(j-1));
    
    if Err < err %Condicional de error y solucion
      break; %Converge
    endif
    
    if Err>err && i>N
      msgID = 'Newton:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg);
    endif
    
  end
   
  %Resultado
  FF = f(x_sol);
  
end