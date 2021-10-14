%PUNTO FIJO
%   PUNTOFIJO(FUN,A,D,T,ITER) llenar
%       [c,datos] = puntoFijo(fun, a, d, tol, iter)
%       c = raiz de la función
%       datos = todas las variables de la ejecución
%       fun = la función a tratar
%       a = valor inicial de x
%       d = derivada de la funcion
%       tol = tolerancia
%       iter = número máximo de iteraciones

function [c,datos,i] = puntoFijo(fun,a,d,tol=0.01,iter=1000)
  i=1;
  f=fun;
  der=d;
  new_x=0;
  
  while i<=iter
    if i>0
      a=new_x;
      %Aproximamos la raiz con la fÃ³rmula correpondiente
      new_x=a-(f(a)*(1/der(a)));
      %Calculamos el porcentaje de error
      ea=abs((new_x-a)/new_x)*100;
      %almacenamos los datos para la funcion Main
      datos(i,1)=new_x;
      datos(i,2)=ea;
      c=new_x;
    elseif i>iter
      msgID = 'PUNTOFIJO:iteraciones';
      msg = 'Gran número de iteraciones, posiblemente el método divergió';
      error(msgID,msg);
    endif
    if ea<tol
      break;
    endif
    i=i+1;
  endwhile

  